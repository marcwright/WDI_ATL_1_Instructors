# RAILSCAFE3

Rails.application.routes.draw do

  resources :pastries

  get    'beans/' =>          'beans#index',    as: :beans

  post   'beans/' =>          'beans#create'

  get    'beans/new' =>       'beans#new'

  get    'beans/:id' =>       'beans#show',     as: :bean

  get    'beans/:id/edit' =>  'beans#edit'

  patch  'beans/:id' =>       'beans#update'

  delete 'beans/:id' =>       'beans#destroy'

end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'