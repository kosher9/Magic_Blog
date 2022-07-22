class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: { success: true, data: { posts: @posts } }
  end
end
