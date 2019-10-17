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
    image_info = params[:image]
    image = Image.create(user_id: image_info[:user_id], image_url: image_info[:image_url], transformations: image_info[:transformations])
    # render json: ImageSerializer.new(image)
    render json: image
  end

  def edit
  end

  def update
   @image.update(user_id: @image.user_id, image_url: params[:image][:image_url], transformations: params[:transformation])
     options = {
       include: [:user]
     }
    render json: ImageSerializer.new(@image, options)
  end

  def destroy
   @image.destroy
   render json: @image
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end

end
