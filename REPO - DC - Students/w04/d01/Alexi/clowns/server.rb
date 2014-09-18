require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/roller_coaster'
require_relative './models/config'

get '/' do
  erb :home
end

# Index Action
# Read all of the clowns

get '/clowns' do
  @clowns = Clown.all
  erb :'clowns/index'
end

# New Action
# Displays form for creating a clown

get '/clowns/new' do
  erb :'clowns/new'
end


# Creates Action
# Creates clown
post 'clowns' do
    Clown.create({
      name: params[:name],
      talent: params[:talent],
      is_creepy: (params[:is_creepy] || false),
      image_url: params[:image_url]
    })
  redirect to('/clowns' + @clown.id.to_s)
end
# Show individual clown

get '/clowns/:id' do
  @clown = Clown.find(params[:id])
  erb :'clowns/show'
end


# Edit displays form


get '/clowns/:id/edit' do
  @clown = Clown.find(params[:id])
  erb :'clowns/edit'
end

patch '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.update({
    name: params[:name],
    talent: params[:talent],
    is_creepy: (params[:is_creepy] || false),
    image_url: (params[:image_url])
  })
  redirect to('/clowns' + clown.id.to_s)
end

# Destroy Action
# Deletes the clown

delete '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.destory
  redirect to('/clowns')
end
