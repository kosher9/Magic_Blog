class LikesController < ApplicationController
  def create
    @user = ApplicationController.new.current_user
    @like = @user.likes.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = ApplicationController.new.current_user
    add_like = @user.likes.new(comment_params)
    add_like.post = @post
    add_like.author = @user
    respond_to do |format|
      format.html do
        if add_comment.save
          flash[:success] = 'Post created successfully'
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { like: add_like }
        end
      end
      # redirect_to user_posts_url
    end
  end

  private

  def comment_params
    params.require(:like).permit(:text)
  end
end
