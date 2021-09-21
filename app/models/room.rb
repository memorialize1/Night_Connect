class Room < ApplicationRecord
  
  has_many        :relation_rooms
  has_many        :chats
  belongs_to      :user
  
  validates :name,  presence: true
  
end
