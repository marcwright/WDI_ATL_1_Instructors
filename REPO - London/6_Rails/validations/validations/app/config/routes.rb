Associations::Application.routes.draw do
  resources :people


  get "customers/index"

  get "customers/new"

  get "customers/create"

  root to: 'application#home'
end
