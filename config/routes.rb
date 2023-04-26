Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :messages
  resources :rooms
  resources :room_users

  resources :users, param: :_email
  post '/login', to: 'authentication#login'
  get '/confirm/:id', to: 'users#confirm_email'

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :posts
      end
    end 
  end

end
