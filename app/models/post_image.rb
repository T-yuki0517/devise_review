class PostImage < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_one_attached :image
  
  validates :devise_name, presence: true
  
  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres
end
