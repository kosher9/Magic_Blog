class UsersController < ApplicationController
  def index
    render html: '<div>Here is the list of our users</div>'.html_safe
  end

  def show
    render html: '<div>Here is the user you are looking for</div>'
  end
end
