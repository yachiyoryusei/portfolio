Rails.application.routes.draw do
  
  
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users
  resources :posts
  resources :categories, except: [:show]
  get 'mains/index' => 'mains#index'
  
  root 'mains#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
