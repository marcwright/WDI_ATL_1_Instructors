Ransacking::Application.routes.draw do
  resources :articles do
    collection do
      get "published", to: 'articles#published_articles'
      get "michaels", to: 'articles#michaels_articles'
      match 'search', to: 'articles#search', via: [:get, :post], as: :search
    end
  end

end
