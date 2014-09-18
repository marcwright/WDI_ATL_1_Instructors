Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root "welcome#index"
  get "/auth" => "sessions#new"
 end
