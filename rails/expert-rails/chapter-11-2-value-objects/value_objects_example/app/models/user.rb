# rails g user phone_number

# class User < ApplicationRecord
#   def phone_number
#     @phone_number ||= PhoneNumber.new(self[:phone_number])
#   end

#   def phone_number=(new_phone_number)
#     self[:phone_number] = new_phone_number.value
#     @phone_number = new_phone_number
#   end
# end

class User < ApplicationRecord
  composed_of :phone_number, mapping: %w[phone_number value]
end
