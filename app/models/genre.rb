class Genre < ApplicationRecord
  
  
  has_many   :boards,     dependent: :destroy
  
  belongs_to :user
  
  
  
  validates :name,  presence: true
end
