Rails.application.routes.draw do
  root "characters#index"
  resources :characters, only: [:create, :destroy, :index, :update]
end
