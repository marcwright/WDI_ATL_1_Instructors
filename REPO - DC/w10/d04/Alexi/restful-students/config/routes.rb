Rails.application.routes.draw do
  
  resources :students
  root 'app#index'
  get '/templates' => 'app#templates'

end
