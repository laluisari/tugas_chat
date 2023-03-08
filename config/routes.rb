Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  get 'messages', to: 'messages#index'
  post 'messages', to: 'messages#create'

end
