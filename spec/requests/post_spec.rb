# require 'rails_helper'
#
# RSpec.describe Post, type: :request do
#   describe 'GET #index' do
#     before(:example) { get user_posts_path(1) }
#
#     it 'should be a success' do
#       expect(response).to have_http_status(:ok)
#     end
#
#     it 'should render \'index\' template' do
#       expect(response).to render_template('index')
#     end
#
#     it 'should have the corresponding placeholder' do
#       expect(response.body).to include('Here is a list of all posts from that user')
#     end
#   end
#
#   describe 'GET #show' do
#     before(:example) { get user_post_path(1, 1) }
#
#     it 'should be a success' do
#       expect(response).to have_http_status(:ok)
#     end
#
#     it 'should render \'show\' template' do
#       expect(response).to render_template('show')
#     end
#
#     it 'should have the corresponding placeholder' do
#       expect(response.body).to include('Here is a the post you are looking for')
#     end
#   end
# end
