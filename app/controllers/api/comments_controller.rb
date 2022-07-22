class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.where({ post_id: params[:post_id] }).order('created_at')
    render json: { success: true, data: { comments: @comments } }
  end

  def create
    @post = Post.find(params[:post_id])
    @user_post = User.find(8)
    @comment = Comment.create(author: @user_post, post: @post, text: comment_params['text'])
    if @comment.save
      render json: { success: true, data: { comment: @comment } }, status: :created
    else
      render json: { success: false, errors: @comment.errors }, status: :bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
