class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    images = Image.all
    render json: ImageSerializer.new(images)
  end

  def show
    # image = Image.find(params[:id])
    options = {
      include: [:user]
    }
    render json: ImageSerializer.new(@image, options)
  end

  def create
    image = Image.create(user_id: params[:image][:user_id], image_url: params[:image][:image_url])
    render json: image
  end

  def edit
  end

  def update
   if @image.update(user_id: params[:image][:user_id], image_url: params[:image][:image_url])
     render json: image
   else
     render :edit
   end
  end

  def destroy
   @image.destroy
   redirect_to itineraries_path(current_user)
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end

end
