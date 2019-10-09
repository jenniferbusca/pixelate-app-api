class ImagesController < ApplicationController
  def index
    images = Image.all
    render json: ImageSerializer.new(images)
  end

  def show
    image = Image.find(params[:id])
    options = {
      include: [:user]
    }
    render json: ImageSerializer.new(image, options)
  end

  def create
    image = Image.create(image_params)
    render json: image
  end

  private

  def image_params
    params.require(:image).permit(:user, :title, :image, :bytes)
  end

end
