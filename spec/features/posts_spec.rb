require 'rails_helper'

RSpec.describe 'Testing post index page' do

  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'John', photo: 'profile.jpg', bio: 'Developer.')
      @post = Post.create(author_id: @first_user, text: 'post text', title: 'post title')
    end
  end

end
