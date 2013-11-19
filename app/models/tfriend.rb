class Tfriend < ActiveRecord::Base
  attr_accessible :friend_id, :friends_id
  
   belongs_to :friend, class_name: "User"
  belongs_to :friends, class_name: "User"
  
  validates :friend_id, presence: true
  validates :friends_id, presence: true
end
