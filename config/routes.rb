Rails.application.routes.draw do
  resources :pizzeria_points
  resources :storages
  resources :ingredients_prices
  resources :pizza_orders do
    put 'complete', on: :member
  end
  resources :pizza_sizes
  resources :adresses
  resources :pizza_types
  root 'home#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
