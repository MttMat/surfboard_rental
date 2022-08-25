Rails.application.routes.draw do
  get 'surfboards/index'
  devise_for :users
  root to: "pages#home"
  resources :surfboards
  resources :users
  resources :rentals
  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
