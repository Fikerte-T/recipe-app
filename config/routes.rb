Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users do
    resources :general_shopping_list
    resources :foods
    resources :recipes do
      resources :recipe_food
    end
  end
  resources :public_recipes
  root 'public_recipes#index'
end
