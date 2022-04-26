Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users do
    resources :general_shopping_list
    resources :foods
    resources :recipes do
      resources :public_recipes
    end
  end
  root 'foods#index'
end
