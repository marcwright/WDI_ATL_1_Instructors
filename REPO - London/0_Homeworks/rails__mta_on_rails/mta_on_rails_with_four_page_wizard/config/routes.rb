MtaOnRails::Application.routes.draw do
  get '/index', to: 'journey#index'
  post '/calculate', to: 'journey#calculate'



  root :to => 'journey#index'


end
