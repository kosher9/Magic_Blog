class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @user = ApplicationController.new.current_user
    # @like = @user.likes.new
    add_like = Like.create(author: @user, post: @post)
    # add_like.post = @post
    # add_like.author = @user
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
      # redirect_to user_posts_url
    end
  end

end
