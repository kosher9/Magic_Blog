require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'is valid with valid attributes ' do
    expect(User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Teacher from Mexico.')).to be_valid
  end

  it 'is not valid with name empty ' do
    expect(User.create(name: '', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Teacher from Mexico.')).to_not be_valid
  end

  it 'is not valid with posts_counter nil' do
    expect(User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Teacher from Mexico.', posts_counter: nil)).to_not be_valid
  end

  it 'is not valid with posts_counter of type string' do
    expect(User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Teacher from Mexico.', posts_counter: 'nil')).to_not be_valid
  end
end
