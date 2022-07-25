Rails.application.routes.draw do
  root "static_pages#home"
  get 'static_pages/signin'
  get '/signup',    to: 'users#new'
  resources :users
end
