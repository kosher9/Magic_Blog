require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  describe 'Post' do
    before(:each) do
      @user = User.create(name: 'Nemwel', photo: 'nemwel.jpg', bio: 'Taekwondo master.')
      @post = Post.create(author: @user, title: 'Tests', text: 'testing', likes_counter: 7,
                          comments_counter: 5)
      @post.save
      @comment1 = Comment.create(text: 'My first comment', author: @user, post: @post)
      @comment2 = Comment.create(text: 'My second comment', author: @user, post: @post)
    end

    feature 'Post index page' do
      background { visit user_posts_path(@user.id) }

      it 'I can see the user\'s profile picture.' do
        expect(page.first('img')['src']).to have_content 'nemwel.jpg'
      end

      it 'I can see the number of posts the user has written' do
        expect(page).to have_content('Number of posts : 0')
      end

      it 'I can see some of the post\'s body' do
        expect(page).to have_content 'testing'
      end

      it 'I can see the user\'s username.' do
        expect(page).to have_content 'Nemwel'
      end

      it 'I can see how many comments a post has.' do
        expect(page).to have_content 'Comments : 5'
      end

      it 'I can see how many likes a post has.' do
        expect(page).to have_content 'Likes : 7'
      end

      it 'I can see a section for pagination if there are more posts than fit on the view.' do
        expect(page).to have_content 'Pagination'
      end

      it 'When I click on a post, it redirects me to that post\'s show page.' do
        click_link
        expect(current_path).to eq user_post_path(@user.id, @post.id)
      end
      it 'if comments counter is integer' do
        @post.comments_counter = 8
        expect(@post).to be_valid
      end
    end

    feature 'Post show' do
      background { visit user_post_path(@user.id, @post.id) }
      it 'I can see the post\'s title.' do
        expect(page).to have_content 'testing'
      end

      it 'Can see who wrote the post' do
        expect(page).to have_content 'Nemwel'
      end
      it 'Can see how many comments it has' do
        expect(page).to have_content 'Comments : 5'
      end
      it 'Can see how many likes it has' do
        expect(page).to have_content 'Likes : 7'
      end
      it 'Can see the post body' do
        expect(page).to have_content 'testing'
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
end
