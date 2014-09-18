Rails.application.routes.draw do
  resources :venues do
    resources :events, shallow: true, except: [:create, :destroy]
  end

  resources :bands do
    resources :events, shallow: true, except: [:create, :destroy]
  end

  resources :events

  root "events#index"
end
