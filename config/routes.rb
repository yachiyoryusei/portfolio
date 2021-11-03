Rails.application.routes.draw do
  
  
  devise_for :users
  resources :users
  resources :posts
  resources :categories, except: [:show]
  get 'mains/index' => 'mains#index'
  
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
