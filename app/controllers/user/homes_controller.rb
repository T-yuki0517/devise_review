class User::HomesController < ApplicationController
  def top
    @post_images = PostImage.order(created_at: :desc).limit(4)
  end
  def about
  end
end
