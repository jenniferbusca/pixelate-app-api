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
    image = Image.create(user_id: params[:image][:id], image_url: params[:image][:image_url])
    render json: image
  end

end
