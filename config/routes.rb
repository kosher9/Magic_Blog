Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  # get(devise_session)
  resources :users, only: [:index, :show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[new create]
    end
  end

  # Create a new user with token
  post 'api/auth/sign_up', to: 'api/registration#create'
  # Generate token for an existing user
  get 'api/auth/:id', to: 'api/registration#auth'

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show] do
      resources :posts, only: %i[index] do
        resources :comments, only: %i[index create]
      end
    end
  end
end
