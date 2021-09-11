class BoardComment < ApplicationRecord
  
  
  belongs_to :board
  belongs_to :user
  
  validates :board_id,  presence: true
  validates :user_id,   presence: true
  validates :comment,   presence: true
  
end
