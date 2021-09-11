class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :inquiries,         dependent: :destroy
         has_many :answers,           dependent: :destroy
         has_many :boards,            dependent: :destroy
         has_many :board_comments,    dependent: :destroy
         has_many :genres
         has_many :relationships,     dependent: :destroy
         
         
         validates :name,  presence: true
end
