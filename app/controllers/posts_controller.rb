class PostsController < ApplicationController
  def index
    render html: '<div>Here is the list of all his posts</div>'.html_safe
  end

  def show
    render html: '<div>Here is the post you are looking for</div>'.html_safe
  end
end
