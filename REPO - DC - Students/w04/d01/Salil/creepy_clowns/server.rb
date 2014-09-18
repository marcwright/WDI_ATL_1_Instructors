require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'


require_relative './models/config'
require_relative './models/clown'



get '/' do
  erb :home
end

get '/clowns' do
  @clowns = Clown.all
  erb :'clowns/index'
end

get '/clowns/new' do
  erb :'clowns/new'
end


post '/clowns' do
  clown = Clown.create ({
    name: params[:name],
    talent: params[:talent],
    is_creepy: (params[:is_creepy] || false),
    image_url: params[:image_url]
    })
  redirect to('/clowns/' + clown.id.to_s)
end

get '/clowns/:id' do
  @clown = Clown.find(params[:id])
  erb :'clowns/show'
end

get '/clowns/:id/edit' do
  @clown = Clown.find(params[:id])
  erb :'clowns/edit'
end

patch '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.update ({
    name: params[:name],
    talent: params[:talent],
    is_creepy: (params[:is_creepy] || false),
    image_url: params[:image_url]
    })
  redirect to('/clowns/' + clown.id.to_s)
end

binding.pry
