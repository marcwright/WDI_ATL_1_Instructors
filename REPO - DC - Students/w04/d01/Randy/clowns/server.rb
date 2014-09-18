require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/clown'


get '/' do
 erb :home
end


#INDEX ACTION - - Read all of the clowns.
get '/clowns' do
  @clowns = Clown.all
  erb :'clown_views/index'
end

get '/clowns/new' do
  erb :'clown_views/new'
end

post '/clowns' do
  clown = Clown.create(name: params[:name], talent: params[:talent], is_creepy: params[:is_creepy], image_url: params[:image_url])
  redirect to('/clowns/' + clown.id.to_s)
end

get '/clowns/:id' do
  @clown = Clown.find(params[:id])
  erb :'clown_views/show'
end

#Edit ACTION
# Display a form to Edit
get '/clowns/:id/edit' do
  @clown = Clown.find(params[:id])
  erb :'clown_views/edit'
end

patch '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.update(name: params[:name], talent: params[:talent], is_creepy: params[:is_creepy], image_url: params[:image_url])
  redirect to('/clowns/' + clown.id.to_s)
end

#Destroy action -- deletes a clown

# delete '/clowns/:id' do
#   clown = Clown.find(params[:id])
#   Clown.destroy(name: params[:name], talent: params[:talent], is_creepy: params[:is_creepy], image_url: params[:image_url])
# end
