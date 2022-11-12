class PostGenre < ApplicationRecord
  belongs_to :post_image
  belongs_to :genre
end
