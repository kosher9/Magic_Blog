class UsersController < ApplicationController
  def index
    redirect_to new_user_session_path if current_user.nil?
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end
end
