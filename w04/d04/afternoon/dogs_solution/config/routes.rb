Rails.application.routes.draw do

  root 'welcome#index'
  # get '/about' => 'welcome#about'

  # get '/dogs' => 'dogs#index'
  # get '/dogs/new' => 'dogs#new'
  # post '/dogs' => 'dogs#create'
  # get '/dogs/:id' => 'dogs#show'

  # resources :dogs, { :except => [:new, :index, :show] }
  resources :dogs do
    resources :toys
  end

end
