Rails.application.routes.draw do

  root 'students#index'
  # get '/templates' => 'students#templates'
  resources :students

end
