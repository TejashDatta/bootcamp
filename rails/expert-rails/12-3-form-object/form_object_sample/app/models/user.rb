# rails g model user email password_digest

class User < ApplicationRecord
  has_secure_password
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  vaildates :password, format: { with: /\A[\p{ascii}&&[^\x20]]{8, 72}\z/ }, allow_nil: true
end
