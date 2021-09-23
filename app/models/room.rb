class Room < ApplicationRecord
  
  has_many        :relation_rooms,        dependent: :destroy
  has_many        :chats,                 dependent: :destroy
  belongs_to      :user
  
  validates :name,  presence: true
  
end
