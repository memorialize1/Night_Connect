class Genre < ApplicationRecord
  
  
  has_many   :boards,     dependent: :destroy
  
  
  
  
  validates :name,  presence: true
end
