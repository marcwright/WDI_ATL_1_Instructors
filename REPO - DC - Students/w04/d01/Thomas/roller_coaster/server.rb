require "sinatra"
require "sinatra/reloader"
require "pry"
require "active_record"

require_relative './models/config'
require_relative './models/roller_coaster'

get '/' do
  erb :home
end

get '/roller_coasters' do
  @roller_coasters = RollerCoaster.all
  erb :'roller_coaster/index'
end

get '/roller_coasters/new' do
  erb :'roller_coaster/new'
end

post '/roller_coasters' do
  coaster = RollerCoaster.create({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
    })
  redirect to('/roller_coasters/' + coaster.id.to_s)
end

get '/roller_coasters/:id' do
  @roller_coasters = RollerCoaster.find(params[:id])
  erb :'roller_coaster/show'
end

get '/roller_coasters/:id/edit' do
  @coaster = RollerCoaster.find(params[:id])
  erb :'roller_coaster/edit'
end
