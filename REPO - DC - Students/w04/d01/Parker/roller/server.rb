require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/roller'

get '/' do
  erb :home
end

# roller.create(name: "Trozo", talent: "baloon animals", is_creepy: false, image_url: "http://resources2.news.com.au/images/2012/07/27/1226436/963434-guatemala-roller-congress.jpg")

get '/' do
  erb :home
end

# Index Action
# Read all of the rollers
get '/rollers' do
  @rollers = Roller.all
  erb :'rollers/index'
end

# New Action
# Displays a form for creating a roller
get '/rollers/new' do
  erb :'rollers/new'
end

# Create Action
# Creates the roller
post '/rollers' do
  roller = Roller.create({
    name: params[:name],
    speed: params[:speed],
    height: params[:height],
    image_url: params[:image_url]
  })
  redirect to('/rollers/' + roller.id.to_s)
end

# Show Action
# Displays a single roller
get '/rollers/:id' do
  @roller = Roller.find(params[:id])
  erb :'rollers/show'
end

# Edit Action
# Displays a form to Edit
get '/rollers/:id/edit' do
  @roller = Roller.find(params[:id])
  erb :'rollers/edit'
end

# Update Action
# Updates the roller
patch '/rollers/:id' do
  roller = Roller.find(params[:id])
  roller.update({
    name: params[:name],
    speed: params[:speed],
    height: params[:height],
    image_url: params[:image_url]
  })
  redirect to('/rollers/' + roller.id.to_s)
end

# Destroy Action
# Deletes the roller
delete '/rollers/:id' do
  roller = Roller.find(params[:id])
  roller.destroy
  redirect to('/rollers')
end