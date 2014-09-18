Hogwarts::Application.routes.draw do

root "houses#index"
  resource :houses, only: [:index, :show] do
    resources :students
  end

  resources :students
  resource :houses
end
