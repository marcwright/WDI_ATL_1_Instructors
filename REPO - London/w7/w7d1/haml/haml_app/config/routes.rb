HamlApp::Application.routes.draw do
  get "/", to: "home#index"
  get "/haml", to: "home#index_haml"
  get '/practice', to: 'home#haml_practice'
  get '/scss', to: 'home#scss_practice'
end
