Hogwarts::Application.routes.draw do
 

resources :house, only: [:index, :show]
resources :student, only: [:index, :show]



root "house#index"
end
