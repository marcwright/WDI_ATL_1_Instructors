Rails.application.routes.draw do
  resources :markers, only: [:index, :create]

  root "map#index"
end
