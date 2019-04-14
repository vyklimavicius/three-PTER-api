class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      render json: @user, status: 201
    else
      render json: { error: "A username limited to three letters!"}, status: 403
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
