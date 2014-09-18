Cookbook::Application.routes.draw do

  resources :users, only: [:index, :new, :create]

  get    '/signup', to: 'users#new',         as: 'signup'
  get    '/login',  to: 'sessions#new',      as: 'login'
  delete '/logout', to: 'sessions#destroy',  as: 'logout'

  resources :sessions, only: [:new, :create, :destroy]

  resources :ingredients

  resources :recipes do
    resources :quantities, only: [:new, :destroy, :create]
  end

  root to:  "recipes#index"

end
