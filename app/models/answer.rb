class Answer < ApplicationRecord
  
  belongs_to :user
  belongs_to :inquiry
  
  
  validates :title,         presence: true
  validates :inquirie_id,   presence: true
  validates :answer,        presence: true
  
end
