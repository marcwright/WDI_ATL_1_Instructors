Rails.application.routes.draw do
  resources :songs, only: [:create, :destroy]
  
  root "songs#index"
end
