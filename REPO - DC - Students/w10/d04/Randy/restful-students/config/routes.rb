Rails.application.routes.draw do


  resources :students, only: [:index, :create, :update, :destroy]
  root 'students#index'
  get '/templates' => 'app#templates'

end
