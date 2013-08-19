# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  username   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
attr_accessible :name, :username, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.username = username.downcase }
  before_save :create_remember_token
  
   validates :name,  presence: true, length: { maximum: 50 } 
      VALID_USERNAME_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

    private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


	
end
