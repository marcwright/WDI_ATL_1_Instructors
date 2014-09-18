require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/coaster'


get '/' do
 erb :home
end


#INDEX ACTION - - Read all of the clowns.
get '/coasters' do
  @coasters = Coaster.all
  erb :'coasters/index'
end

get '/coasters/new' do
  erb :'coasters/new'
end

post '/coasters' do
  coaster = Coaster.create(name: params[:name], max_height: params[:max_height], top_speed: params[:top_speed], image_url: params[:image_url])
end

get '/coasters/:id' do
  @coaster = Coaster.find(params[:id])
  erb :'coasters/show'
end

# #Edit ACTION
# # Display a form to Edit
get '/coasters/:id/edit' do
  @coaster = Coaster.find(params[:id])
  erb :'coasters/edit'
end

patch '/coasters/:id' do
  coaster = Coaster.find(params[:id])
  coaster.update(name: params[:name], max_height: params[:max_height], top_speed: params[:top_speed], image_url: params[:image_url])
  redirect to('/coasters/' + coaster.id.to_s )
end

#Destroy action -- deletes a clown

delete '/coasters/:id' do
  coaster = Coaster.find(params[:id])
  coaster.destroy
  redirect to('/')
end
