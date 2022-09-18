Rails.application.routes.draw do
  get 'reservation/index'
  # get 'motorcycles/index'
  # get 'categories/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # devise_for :users

  namespace :api do
    namespace :v1 do
      resources :category
      resources :motorcycle
      resources :reservations
    end
  end
end
