Rails.application.routes.draw do
  
  root 'app#index'
  get '/templates' => 'app#templates'

end
