class Room < ApplicationRecord

  has_many        :relation_rooms,        dependent: :destroy
  has_many        :chats,                 dependent: :destroy
  belongs_to      :user

  validates :name,  presence: true


  #ルーム内にuserが参加しているかどうか
  def joind_by?(user)
     relation_rooms.find_by(participant_id: user.id).present?
  end





end
