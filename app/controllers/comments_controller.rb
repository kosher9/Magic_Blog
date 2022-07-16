class CommentsController < ApplicationController
  def new
    puts("params #{params}")
    @post = Post.find(params[:post_id])
    @user = ApplicationController.new.current_user
    @comment = @user.comments.new
    render :new, locals: { comment: @comment }
  end

  def create
    @post = Post.find(params[:post_id])
    @user = ApplicationController.new.current_user
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
      redirect_to user_posts_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
