require 'rails_helper'

RSpec.describe 'Testing user index page', type: :feature do
  describe 'User' do
    before(:each) do
      @first_user = User.create(name: 'John', photo: 'profile.jpg', bio: 'Developer.')
      @second_user = User.create(name: 'Sarah', photo: 'profile.jpg', bio: 'Web Developer.')
      @second_user = User.create(name: 'Tobin', photo: 'profile.jpg', bio: 'Frontend Developer.')

      @first_post = Post.create(author_id: @first_user.id, text: 'post text', title: 'post title')
      @first_post.save
    end

    feature 'User Index page' do
      background { visit users_path }

      scenario 'shows the right content' do
        visit users_path
        sleep(5)
        expect(page).to have_content('Create new post')
      end

      scenario 'See all usernames' do
        expect(page).to have_content('Sarah')
        expect(page).to have_content('Tobin')
        expect(page).to have_content('John')
      end

      scenario 'See the number of posts each user has written' do
        expect(page).to have_content('Number of posts : 0')
      end

      scenario "When I click on a user, I am redirected to that user's show page" do
        click_link 'John', match: :first
        expect(current_path).to eq user_path(User.first.id)
      end

      scenario 'See profile picture for each user' do
        expect(page.first('img')['src']).to have_content 'profile.jpg'
      end

    end


    feature 'User show page' do
      background { visit user_path(@first_user.id) }

      scenario 'I can see the user\'s profile picture' do
        expect(page.first('img')['src']).to have_content 'profile.jpg'
      end

      scenario 'I can see the user\'s username' do
        expect(page).to have_content('John')
      end

      scenario 'I can see the user\'s bio' do
        expect(page).to have_content('Developer.')
      end

      scenario 'I can see the user\'s first 3 posts' do
        expect(page).to have_content('post title post text')
      end

      scenario 'I can see a button that lets me view all of a user\'s posts' do
        expect(page).to have_content('See all posts')
      end

      scenario 'I can see the number of posts the user has written' do
        expect(page).to have_content("Number of posts : #{@first_user.posts_counter}")
      end

      scenario 'When I click a user\'s post, it redirects me to that post\'s show page.' do
        click_link 'post title post text'
        expect(current_path).to eq user_post_path(@first_user.id, Post.first.id)
      end

      scenario 'redirects to the user\'s post\'s index page when you click on a see all posts' do
        click_link 'See all posts'
        expect(current_path).to eq user_posts_path(@first_user.id)
      end

    end
  end
end
