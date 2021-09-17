class Board < ApplicationRecord
  
  has_many :board_comments,   dependent: :destroy
  
  belongs_to :user
  belongs_to :genre
  
  validates :title,       presence: true
  validates :genre_id,    presence: true
  
end
