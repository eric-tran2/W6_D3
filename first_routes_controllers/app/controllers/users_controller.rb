class UsersController < ApplicationController
  def index
    render plain: "I'm in the index action!!!"
  end

  def create
    render json: params
  end

  def show
    render json: params
  end

  def user_params
    #requires that all data sent by user is under key of "yip"
    params.require(:user).permit(:name, :email)
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end


end