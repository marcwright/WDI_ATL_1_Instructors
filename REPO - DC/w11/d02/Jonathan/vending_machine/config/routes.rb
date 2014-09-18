Rails.application.routes.draw do
  
  root "app#index"
  resources :products, except: [:new, :edit]
  
end
