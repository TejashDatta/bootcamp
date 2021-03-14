class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'owner_id'
  
  def self.find_or_create_from_auth_hash!(auth_hash)
    User.find_or_create_by!(provider: auth_hash[:provider], uid: auth_hash[:uid]) do |user|
      user.name = auth_hash[:info][:nickname]
      user.image_url = auth_hash[:info][:image]
    end
  end
end
