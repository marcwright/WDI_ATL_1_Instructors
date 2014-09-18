Rails.application.routes.draw do
  root "welcome#index"
  get "/signup"     => "users#new"
  get "/signin"     => "sessions#new"
  delete "/signout" => "sessions#destroy"

  resources :artists do
    resources :songs, shallow: true, except: [:index, :show]
  end

  resources :users, except: [:index]
  resources :sessions, only: [:create]
end
