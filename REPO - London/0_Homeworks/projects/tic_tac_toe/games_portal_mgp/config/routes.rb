GamesPortalMgp::Application.routes.draw do
  root to: "home#index"

  devise_for :users

  resources :games, except: [:edit, :update, :destroy] do
    member do
      post 'make_move/:square', action: 'make_move', as: :make_move
    end
  end
end
