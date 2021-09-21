class RelationRoom < ApplicationRecord
  
  belongs_to :room
  belongs_to :Participant, class_name: 'User'
  belongs_to :user
  
  
  validates :room_id,         presence: true
  validates :participant_id,  presence: true
  
end
