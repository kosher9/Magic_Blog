class UsersController < ApplicationController
  def index
    redirect_to new_user_session_path if current_user.nil?
    @users = User.all
    @user = current_user
  end

  def show
    if params[:id] == 'sign_out'
      redirect_to new_user_session_path
    else
      @user = current_user
    end
  end
end
