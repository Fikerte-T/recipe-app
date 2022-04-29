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
    resources :recipes do
      resources :recipe_foods
    end
  end

  resources :public_recipes
  resources :recipes do
    resources :recipe_foods
  end
  root 'users#index'
end
