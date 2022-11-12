class Admin::PostImagesController < ApplicationController
  def index
    @post_images = params[:genre_id].present? ? Genre.find(params[:genre_id]).post_images : PostImage.page(params[:page]).reverse_order
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:devise_name, :image, :caption, genre_ids: [])
  end
end
