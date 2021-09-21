class Inquiry < ApplicationRecord
  
  has_many :answers   ,dependent: :destroy
  
  belongs_to :user
  
  validates :title,     presence: true
  validates :inquiry,  presence: true
  validates :user_id,   presence: true
  
  
end
