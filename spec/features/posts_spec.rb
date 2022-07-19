require 'rails_helper'
RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @user = User.create(name: 'Nemwel', photo: 'nemwel.jpg', bio: 'Taekwondo master.', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Tests', text: 'testing', likes_counter: 7,
                          comments_counter: 5)
    end
    before { @post.save }
    it 'if there is max 250 characters' do
      @post.title = 'Testing'
      expect(@post).to be_valid
    end
    it 'if likes counter is integer' do
      @post.likes_counter = 5
      expect(@post).to be_valid
    end
    it 'if likes counter greater than or equal to zero' do
      @post.likes_counter = -9
      expect(@post).to_not be_valid
    end
    it 'if comments counter greater than or equal to zero.' do
      @post.comments_counter = -5
      expect(@post).to_not be_valid
    end
    it 'if comments counter is integer' do
      @post.comments_counter = 8
      expect(@post).to be_valid
    end
  end
end


RSpec.describe 'Posts show page', type: :feature do
  # before(:each) do
  #   User.destroy_all
  #   @first_user = User.create(name: 'Nemwel', photo: 'nemwel.jpg', bio: 'Taekwondo master.', post_counter: 0)
  #   @second_user = User.create(name: 'Boniface', photo: 'boniface.jpg', bio: 'Bio Chemist.', post_counter: 0)
  #   Post.create(title: 'My title', text: 'My text', author_id: @first_user.id, likes_counter: 0, comments_counter: 0)
  #   @comment = Comment.create(text: 'My first comment', author: User.first, post: Post.first)
  #   @comment = Comment.create(text: 'My second comment', author: User.first, post: Post.first)
  #   @like = Like.create(author_id: User.first.id, post_id: Post.first.id)
  #   visit "/users/#{User.first.id}/posts/#{Post.first.id}"
  # end

  before(:each) do
    @first_user = User.create(name: 'Nemwel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Kenya.', posts_counter: 0)
    @post1 = Post.create(author: @first_user, title: 'Manager title', text: 'This is my first post', likes_counter: 0,
                         comments_counter: 0)
    @comment1 = Comment.create(text: 'My first comment', author: @first_user, post: @post1)
    @comment2 = Comment.create(text: 'My second comment', author: @first_user, post: @post1)
    @like1 = Like.create(author_id: @first_user.id, post_id: @post1.id)
    visit user_post_path(@first_user, @post1)
  end

  # describe 'Specs for view posts#show' do
  #   it 'Can see the posts title.' do
  #   expect(page).to have_content 'Manager title'
  #   end
  #   end

  #   it 'Can see who wrote the post' do
  #   expect(page).to have_content 'Nemwel'
  # end

  describe 'Specs for view posts#show' do
    it 'Can see who wrote the post' do
      expect(page).to have_content 'Nemwel'
    end
    it 'Can see how many comments it has' do
      expect(page).to have_content 'Comments : 0'
    end
    it 'Can see how many likes it has' do
      expect(page).to have_content 'Likes : 0'
    end
    it 'Can see the post body' do
      expect(page).to have_content 'This is my first post'
    end
    it 'Can see the username of each commentor' do
      expect(page).to have_content 'Nemwel'
    end
    it 'Can see the comment each commentor left' do
      expect(page).to have_content 'My first comment'
      expect(page).to have_content 'My second comment'
    end
  end
end