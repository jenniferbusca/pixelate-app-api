class UsersController < ApplicationController
  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  def show
    user = User.find(params[:id])
    options = {
      include: [:images]
    }
    render json: UserSerializer.new(user, options)
  end

  def create
   user = User.find_or_create_by(email: params[:user][:email], password: params[:user][:password])
   if user.save
    render json: user
   else
    render json: {result: false, user: user.errors }, status: :unprocessable_entity
   end
  end


end
