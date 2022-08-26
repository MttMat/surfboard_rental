Rails.application.routes.draw do
  get 'surfboards/index'
  devise_for :users
  root to: "pages#home"
  resources :surfboards do
    resources :rentals, only: [:create]
  end
  resources :users
  get "/dashboard", to: "pages#dashboard"
  get "/renter", to: "pages#renter"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
