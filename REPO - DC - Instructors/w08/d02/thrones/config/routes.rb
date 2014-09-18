Rails.application.routes.draw do
  root 'characters#index'
  resources :characters, only: [:destroy, :index, :create, :update]
end
