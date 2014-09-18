CookbookOnRails::Application.routes.draw do
 
  resources :recipes
  resources :ingredients
  resources :categories

  
  resources :users


  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
  resources :sessions

  match 'tagged' => 'recipes#tagged', :as => 'tagged'

  root to: "ingredients#index"
  
end
