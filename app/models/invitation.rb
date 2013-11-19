class Invitation < ActiveRecord::Base
  
  attr_accessible :accepted, :invited_id, :trip_id
  
 belongs_to :user_id, :class_name => 'User'
 
  validates :invited_id, presence: true
  validates :trip_id, presence: true
    validates :accepted, presence: true
end
