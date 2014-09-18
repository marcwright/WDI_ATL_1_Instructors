require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative "./models/roller_coaster"
require_relative "./models/config"

get '/' do
  erb :home
end

get '/roller_coasters' do
  @roller_coasters = RollerCoaster.all
  erb :'roller_coasters/index'
end

get '/roller_coasters/new' do
  erb :'roller_coasters/new'
end

post '/roller_coasters' do
  roller_coaster = RollerCoaster.create({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
  })
  redirect to('/roller_coasters/' + roller_coaster.id.to_s)
end

get '/roller_coasters/:id' do
  @roller_coaster = RollerCoaster.find(params[:id])
  erb :'roller_coasters/show'
end

get '/roller_coasters/:id/edit' do
  @roller_coaster = RollerCoaster.find(params[:id])
  erb :'roller_coasters/edit'
end

patch '/roller_coasters/:id' do
  roller_coaster = RollerCoaster.find(params[:id])
  roller_coaster.update({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
    })
  redirect to('/roller_coasters/' + clown.id.to_s)
end

delete '/roller_coasters/:id' do
  roller_coaster = RollerCoaster.find(params[:id])
  roller_coaster.destroy
  redirect to('/roller_coasters')
end


