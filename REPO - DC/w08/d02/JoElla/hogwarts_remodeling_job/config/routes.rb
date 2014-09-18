Hogwarts::Application.routes.draw do

root "houses#index"
resource :houses, only: [:index, :show] do
  resources :students, only: [:index, :show]
  end

 resources :students, only: [:index, :show]

end
