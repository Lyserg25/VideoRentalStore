Rails.application.routes.draw do
  resources :genres
  resources :categories
  resources :products
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
