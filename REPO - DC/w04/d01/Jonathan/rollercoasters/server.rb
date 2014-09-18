require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/ar_rollercoasters'

get '/' do
  erb :home
end

# List all of the rollercoasters
get '/coaster_pages' do
  @coasters = Rollercoaster.all
  erb :'coaster_pages/index'
end

# Displays a form for creating a rollercoaster
get '/coaster_pages/new' do
  erb :'coaster_pages/new'
end

get '/coaster_pages/:id' do
  @coaster = Rollercoaster.find(params[:id])
  erb :'coaster_pages/show'
end

# Create rollercoasters
post '/coaster_pages' do
  coaster = Rollercoaster.create({
    name: params[:name],
    top_speed: params[:top_speed],
    min_height: params[:min_height],
    image_url: params[:image_url]
  })
  redirect to('/coaster_pages/' + coaster.id.to_s)
end

