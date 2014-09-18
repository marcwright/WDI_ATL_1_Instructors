Rails.application.routes.draw do
  resources :dogs do
    resources :toys, shallow: true
  end
  root "shelters#index"
end
