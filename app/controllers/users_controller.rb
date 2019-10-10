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

  # def create
  #   user = User.create(user_params)
  #   render json: user
  # end
  def create
   @user = User.new(email: params[:email], password: params[:password])
     if @user.save
        render json: { result: true, msg: 'User sucessfully created!'}, status: :created
     else
        render json: {result: false, user: @user.errors }, status: :unprocessable_entity
     end
  end


end
