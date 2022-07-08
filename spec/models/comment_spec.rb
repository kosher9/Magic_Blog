require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.')
    @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post')
  end

  it 'is valid with valid attributes' do
    Comment.create(post: @post, author: @author, text: 'Hi Tom!')
  end
end
