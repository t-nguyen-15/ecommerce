Rails.application.routes.draw do
  default_url_options :host => "tony-ecommerce.herokuapp.com/"
  get 'password_resets/new'
  get 'password_resets/edit'
 
  root "static_pages#home"
  get '/signup',    to: 'users#new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
