require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/clown'

get '/' do
  erb :home
end

get '/clowns' do
  @clowns = Clown.all
  #binding.pry
  erb :'clowns/index'
end

#new action, displays form for creating clown
get '/clowns/new' do
  erb :'clowns/new'
end

#create action
post '/clowns' do
  Clown.create({
    name: params[:name],
    talent: params[:talent],
    is_creepy: params[:is_creepy],
    image_url: params[:image_url]
    })
  redirect to('/clowns/' + @clown.id.to_s)
end

#show action
#displays a single clown
get '/clowns/:id' do
  @clown = Clown.find(params[:id])
  erb :'clowns/show'
end

#displays a form to edit
get '/clowns/:id/edit' do
  @clown = Clown.find(params[:id])
  erb :'clowns/edit'
end

patch '/clowns/:id' do
  @clown = Clown.find(params[:id])
  @clown.update({
    name: params[:name],
    talent: params[:talent],
    is_creepy: params[:is_creepy],
    image_url: params[:image_url]
    })
  redirect to('/clowns/' + @clown.id.to_s)
end

#destroy action, deletes a clown
delete '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.destroy
  redirect to('/clowns/')
end

