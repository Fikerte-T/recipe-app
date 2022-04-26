Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :foods
  resources :recipes
  resources :public_recipes
  resources :general_shopping_list

  root "foods#index"
end
