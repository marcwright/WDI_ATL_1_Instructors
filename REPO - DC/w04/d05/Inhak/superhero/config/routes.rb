Rails.application.routes.draw do

  root 'heros#index'
  resources :heros

end
