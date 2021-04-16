module AttributeEncryptableWithoutCallbackObject
  extend ActiveSupport::Concern

  class_methods do
    def attribute_encryptor
      @attribute_encryptor ||= Rails.application.key_generator
                                    .generate_key('attribute encryptor', ActiveSupport::MessageEncryptor.key_len)
                                    .then { |key| ActiveSupport::MessageEncryptor.new(key, serializer: JSON) }
    end

    def encrypt_attributes(*attributes)
      attributes.each do |attribute|
        %i[after_find after_save].each do |callback|
          __send__(callback) do
            self[attribute] = self.class.attribute_encryptor.decrypt_and_verify(self[attribute])
          end
        end

        before_save do
          self[attribute] = self.class.attribute_encryptor.encrypt_and_sign(self[attribute])
        end
      end
    end
  end
end
