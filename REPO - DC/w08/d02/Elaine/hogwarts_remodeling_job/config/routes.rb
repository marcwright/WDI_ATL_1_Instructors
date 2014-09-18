Rails.application.routes.draw do

root "houses#index"
resources :houses, only: [:index, :show] do
  resources :students, only: [:index, :show]
end

get '/houses' => 'houses#index'

get '/students' => 'students#index'

end
