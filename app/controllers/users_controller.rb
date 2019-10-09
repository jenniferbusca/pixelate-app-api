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
   @user = User.new(user_params)
     if @user.save
        render json: { result: true, msg: ' The image has sucessfully uploaded!'}, status: :created
     else
        render json: {result: false, user: @user.errors }, status: :unprocessable_entity
     end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :image)
  end

end
