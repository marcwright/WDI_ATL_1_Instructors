Rails.application.routes.draw do

root 'characters#index'
resources :characters, only: [:create, :update]

end
