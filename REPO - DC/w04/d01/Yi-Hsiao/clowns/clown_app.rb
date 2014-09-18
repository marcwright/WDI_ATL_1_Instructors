require "pry"
require "sinatra"
require "slim"
require_relative "models/config"
require_relative "models/clown"

class ClownApp < Sinatra::Base
  enable :method_override

  get "/" do
    slim :index
  end

  # displays all the saved clown entries
  get "/clowns" do
    @clowns = Clown.all
    slim :"clowns/index"
  end

  # displays an interface to add a new clown
  get "/clowns/new" do
    slim :"clowns/new"
  end

  # saves a new clown entry
  post "/clowns" do
    clown = Clown.create(
      name: params[:name],
      talent: params[:talent],
      is_creepy: params[:creepy] || false,
      image_url: params[:image_url]
    )
    redirect "/clowns/#{ clown.id }"
  end

  # shows a single clown entry
  get "/clowns/:id" do |id|
    @clown = Clown.find(id)
    slim :"clowns/show"
  end

  # displays an interface to edit an existing clown entry
  get "/clowns/:id/edit" do |id|
    @clown = Clown.find(id)
    slim :"clowns/edit"
  end

  # update a clown entry
  patch "/clowns/:id" do |id|
    clown = Clown.find(id)
    clown.update(
      name: params[:name],
      talent: params[:talent],
      is_creepy: params[:creepy] || false,
      image_url: params[:image_url]
    )
    redirect "/clowns/#{ clown.id }"
  end

  # permanently delete a saved clown
  delete "/clowns/:id" do |id|
    Clown.destroy(id)
    redirect "/clowns"
  end
end
