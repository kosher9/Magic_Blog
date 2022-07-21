class PostsController < ApplicationController
  # load_and_authorize_resource
  # before_action :set_post, only: [:index, :show, :destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def destroy
    puts 'Yes I can destroy'
    @post = Post.find(params[:id])
    @comments = @post.comments.where(post_id: @post.id)
    @likes = @post.likes.where(post_id: @post.id)
    @likes.each do |like|
      like.destroy
    end
    @comments.each do |comment|
      comment.destroy
    end
    @post.destroy
  end

  def new
    puts('life in new')
    @user = current_user
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user = current_user
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
