Rails.application.routes.draw do

  root 'users#index'

  resources :users
  resources :sessions, only: [:new, :create]

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  
end