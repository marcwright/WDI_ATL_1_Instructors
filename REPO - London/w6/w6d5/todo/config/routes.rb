Taskr::Application.routes.draw do

  resources :tasks do
    member do
      post :update_position
    end
  end

  root :to => "tasks#index"

end
