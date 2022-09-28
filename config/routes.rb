Rails.application.routes.draw do
  # get 'motorcycles/index'
  # get 'categories/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'users#login'
      post '/create', to: 'users#create'
      resources :motorcycle do
       resources :reservation
      end
    end
  end
  root "api/v1/users#create"
end
