Rails.application.routes.draw do
  
  resources :students
  root 'app#index'

end
