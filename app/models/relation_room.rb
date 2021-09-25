class RelationRoom < ApplicationRecord
  
  belongs_to :room
  belongs_to :participant, class_name: 'User'
  
  
  validates :room_id,         presence: true
  validates :participant_id,  presence: true
  
  
  
end
