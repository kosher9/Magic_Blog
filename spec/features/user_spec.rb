require 'rails_helper'

RSpec.describe 'Testing user index page' do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'John', photo: 'profile.jpg', bio: 'Developer.')
      @second_user = User.create(name: 'Sarah', photo: 'profile.jpg', bio: 'Web Developer.')
      @second_user = User.create(name: 'Tobin', photo: 'profile.jpg', bio: 'Frontend Developer.')
    end

    feature 'User Index' do
      background { visit users_path }

      scenario 'shows the right content' do
        visit users_path
        sleep(5)
        expect(page).to have_content('Create new post')
      end

      scenario 'See all usernames' do
        expect(page).to have_content('Sarah')
        expect(page).to have_content('Tobin')
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
      background { visit user_path(User.first.id) }

      scenario 'I can see the user\'s profile picture' do
        expect(page.first('img')['src']).to have_content 'profile.jpg'
      end

      scenario 'I can see a button that lets me view all of a user\'s posts' do
        expect(page).to have_content('See all posts')
      end

      scenario 'I can see the user\'s username' do
        expect(page).to have_content('John')
      end

    end
  end
end
