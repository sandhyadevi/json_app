# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  username        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
 

before_save { self.username = username.downcase }
  before_create :create_remember_token
  
  
  attr_accessible :name, :username, :password, :password_confirmation
  
  has_secure_password
   has_many :trips, dependent: :destroy
   has_many :tfriends, foreign_key: "friend_id", dependent: :destroy
    has_many :friends_users, through: :tfriends, source: :friends
    
    has_many :reverse_tfriends, foreign_key: "friends_id",
                                   class_name:  "Tfriend",
                                   dependent:   :destroy
  has_many :friendss, through: :reverse_tfriends, source: :friend
  has_many :invitations, foreign_key: "invited", dependent: :destroy
  
  
  
  before_save { |user| user.username = username.downcase }
  before_save :create_remember_token
  
   validates :name,  presence: true, length: { maximum: 50 } 
      VALID_USERNAME_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

    def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def added?(other_user)
    tfriends.where(friends_id: other_user.id).first
  end

  def addfriend!(other_user)
    tfriends.create!(friends_id: other_user.id)
  end
  
  def unfriend!(other_user)
    tfriends.where(friends_id: other_user.id).destroy!
  end
  
  def invited(other_user)
    users.where(user_id: other_user)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

	
end
