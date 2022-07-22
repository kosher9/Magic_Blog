class CommentsController < ApplicationController
  def new
    puts("params #{params}")
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = @user.comments.new
    render :new, locals: { comment: @comment }
  end

  def destroy
    @post = Post.find(params[:post_id])
    @user_post = User.find(params[:user_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user_post.id, @post.id)
  end

  def create
    @post = Post.find(params[:post_id])
    @user_post = User.find(params[:user_id])
    @user = current_user
    add_comment = Comment.create(author: @user, post: @post, text: comment_params['text'])
    @post.save
    respond_to do |format|
      format.html do
        if add_comment.save
          flash[:success] = 'Post created successfully'
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { comment: add_comment }
        end
      end
      redirect_to user_post_path(@user_post.id, @post.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
