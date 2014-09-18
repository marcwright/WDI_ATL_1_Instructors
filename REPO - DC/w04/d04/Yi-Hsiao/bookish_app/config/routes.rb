Rails.application.routes.draw do
  resources :authors do
    resources :books, shallow: true
  end

  resources :books do
    resources :characters, shallow: true
  end

  root "authors#index"
end
