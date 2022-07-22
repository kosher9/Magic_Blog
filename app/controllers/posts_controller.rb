class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    if current_user.nil?
      redirect_to new_user_session_path
      return
    end
    @posts = if current_user.role?
               @user.posts.includes(:comments)
             else
               @user.posts.includes(:comments, :author)
             end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post.destroy
    redirect_to user_post_path(@user.id, @post.id)
  end

  def new
    puts('life in new')
    @user = current_user
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user = current_user
    @add_post = Post.new(author: @user, title: post_params['title'], text: post_params['text'])
    respond_to do |format|
      format.html do
        if @add_post.save
          flash[:success] = 'Post created successfully'
          redirect_to users_path
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
