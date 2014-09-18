CookbookOnRails::Application.routes.draw do

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  resources :sessions

  resources :categories

  resources :ingredients

  resources :recipes

  resources :users

  root :to => 'recipes#index'
end
