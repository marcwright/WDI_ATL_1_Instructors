Rails.application.routes.draw do
  root 'pins#index'
  resources :pins, only: [:create, :index]
end
