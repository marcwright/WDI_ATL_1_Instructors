require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/clown'

# Clown.create(name: "Trozo", talent: "baloon animals", is_creepy: false, image_url: "http://resources2.news.com.au/images/2012/07/27/1226436/963434-guatemala-clown-congress.jpg")

get '/' do
  erb :home
end

<<<<<<< HEAD
binding.pry
=======
# Index Action
# Read all of the clowns
get '/clowns' do
  @clowns = Clown.all
  erb :'clowns/index'
end

# New Action
# Displays a form for creating a clown
get '/clowns/new' do
  erb :'clowns/new'
end

# Create Action
# Creates the clown
post '/clowns' do
  clown = Clown.create({
    name: params[:name],
    talent: params[:talent],
    is_creepy: (params[:is_creepy] || false),
    image_url: params[:image_url]
  })
  redirect to('/clowns/' + clown.id.to_s)
end

# Show Action
# Displays a single clown
get '/clowns/:id' do
  @clown = Clown.find(params[:id])
  erb :'clowns/show'
end

# Edit Action
# Displays a form to Edit
get '/clowns/:id/edit' do
  @clown = Clown.find(params[:id])
  erb :'clowns/edit'
end

# Update Action
# Updates the clown
patch '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.update({
    name: params[:name],
    talent: params[:talent],
    is_creepy: (params[:is_creepy] || false),
    image_url: params[:image_url]
  })
  redirect to('/clowns/' + clown.id.to_s)
end

# Destroy Action
# Deletes the clown
delete '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.destroy
  redirect to('/clowns')
end
>>>>>>> 52749e8ae3d0b5e54f8130872d81374d9c88f308
