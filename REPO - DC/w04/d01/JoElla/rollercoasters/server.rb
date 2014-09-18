require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/rollercoaster'

get '/' do
  erb :home
end

get '/rollercoasters' do
  @coasters = Rollercoasters.all
  erb :'rollercoasters/index'
end

get '/rollercoasters/new' do
  erb :'rollercoasters/new'
end

post '/rollercoasters' do
  Rollercoasters.create({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
    })
  redirect to ('/rollerccoasters/')
end

get '/rollercoasters/:id' do
  @coaster = Rollercoasters.find(params[:id])
  erb :'rollercoasters/show'
end

get '/rollercoasters/:id/edit' do
  @coaster = Rollercoasters.find(params[:id])
  erb :'rollercoasters/edit'
end

patch '/rollercoasters/:id' do
  @coaster = Rollercoasters.find(params[:id])
  @coaster.update({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
    })
  redirect to('/rollercoasters/' + @coaster.id.to_s)
end

delete '/rollercoasters/:id' do
  coaster = Rollercoasters.find(params[:id])
  coaster.destroy
  redirect to('/rollercoasters')
end
