class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    puts('life in new')
    @user = ApplicationController.new.current_user
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user = ApplicationController.new.current_user
    add_post = @user.posts.new(post_params)
    respond_to do |format|
      format.html do
        if add_post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_path
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { post: add_post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
