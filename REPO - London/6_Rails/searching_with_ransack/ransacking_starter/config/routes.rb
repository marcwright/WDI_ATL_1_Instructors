Ransacking::Application.routes.draw do
  resources :articles do
    collection do
      get "published", to: 'articles#published_articles'
    end
  end

end
