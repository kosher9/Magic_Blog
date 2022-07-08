require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.')
    @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post')
  end

  it 'is valid with valid attributes' do
    Like.create(post: @post, author: @author)
  end

  it 'should update like_counter' do
    Like.create(post: @post, author: @author)
    expect(@post.likes_counter).to eq(1)
  end
end
