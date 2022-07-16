class CommentsController < ApplicationController
  def new
    @user = ApplicationController.new.current_user
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user = User.find(params[:user_id])
    add_comment = @user.posts.new(post_params)
  end
end
