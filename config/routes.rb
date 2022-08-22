Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/new'
  default_url_options :host => "tony-ecommerce.herokuapp.com/"
  get 'password_resets/new'
  get 'password_resets/edit'

  get 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
 
  root              to: 'products#index'
  get '/signup',    to: 'users#new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :products do 
    resources :reviews, except: [:show, :index]
  end
end
