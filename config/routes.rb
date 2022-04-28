Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users do
    resources :general_shopping_list
    resources :foods
    resources :recipes 
    resources :recipe_foods
  end
  
  resources :public_recipes
  resources :recipes
  resources :recipe_foods

  root 'users#index'
end
