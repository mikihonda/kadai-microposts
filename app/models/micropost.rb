class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  # has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id'
  # has_many :favorite_users, through: :reverses_of_favorite, source: :user
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
end
