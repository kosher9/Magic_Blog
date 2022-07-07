require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before :each do
    @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.')
  end

  it 'is valid with valid attributes' do
    expect(Post.create(author: @author, title: 'Hello', text: 'This is my first post')).to be_valid
  end

  it 'is not valid with title empty' do
    expect(Post.create(author: @author, title: '', text: 'This is my first post')).to_not be_valid
  end

  it 'is not valid with title exceeding 250 characters ' do
    title = 'r' * 251
    expect(Post.create(author: @author, title:, text: 'This is my first post')).to_not be_valid
  end

end
