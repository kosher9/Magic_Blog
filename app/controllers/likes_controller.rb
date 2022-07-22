class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user_post = User.find(params[:user_id])
    @user = current_user
    @like = @user.likes.new
    add_like = Like.create(author: @user, post: @post)
    @post.save
    respond_to do |format|
      format.html do
        if add_like.save
          flash[:success] = 'Post created successfully'
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { like: add_like }
        end
      end
    end
    redirect_to user_post_path(@user_post.id, @post.id)
  end
end
