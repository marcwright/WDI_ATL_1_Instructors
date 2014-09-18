CookbookInClass::Application.routes.draw do
  root to: "home#home"

  resources :ingredients
  resources :recipes
end
