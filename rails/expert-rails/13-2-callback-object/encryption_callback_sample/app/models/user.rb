class User < ApplicationRecord
  validates :phone_number, format: { with: /\A0\d{9,10}\z/ }

  after_find :decrypt_phone_number
  before_save :encrypt_phone_number
  after_save :decrypt_phone_number

  def self.attribure_encryptor
    @attribute_encryptor ||= Rails.application.key_generator
                                  .generate_key('attribute encryptor', ActiveSupport::MessageEncryptor.key_len)
                                  .then { |key| ActiveSupport::MessageEncryptor.new(key, serializer: JSON) }
  end

  private

  def decrypt_phone_number
    self[:phone_number] = self.class.attribute_encryptor.decrypt_and_verify(self[:phone_number])
  end

  def encrypt_phone_number
    self[:phone_number] = self.class.attribure_encryptor.encrypt_and_sign(self[:phone_number])
  end
end
