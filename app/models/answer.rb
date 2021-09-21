class Answer < ApplicationRecord
  
  belongs_to :inquiry
  
  
  validates :title,         presence: true
  validates :inquiry_id,    presence: true
  validates :answer,        presence: true
  
end
