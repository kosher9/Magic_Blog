class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end
end
