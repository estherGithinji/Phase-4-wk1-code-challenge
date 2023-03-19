Rails.application.routes.draw do

  resources :restaurants, only: [:index, :show, :create, :update, :destroy]
  resources :pizzas, only: [:index, :show, :create, :update, :destroy]
  resources :restaurantpizzas, only: [:index, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
