require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/coasters'

get '/' do
  erb :theme_park
end

# Index Action
# Read all of the clowns

get '/coasters' do
  @coaster = Coaster.all
  erb :'coasters/index'
end


# New Action
# Diplays a form for creating a new clown

get '/coasters/new' do
  erb :'coasters/new'
end

# Create Action
# Creates the coaster
post '/coasters' do
  @coaster = Coaster.create({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
    })
  redirect to('/coasters/' + @coaster.id.to_s)
end

# Show Action
# Displays a single Clown
get '/coasters/:id' do
  @coaster = Coaster.find(params[:id])
  erb :'coasters/display'
end

# Edit Action
# Displays a form to Edit
get '/coasters/:id/update' do
    @coaster = Coaster.find(params[:id])
    erb :'coasters/update'
end

# Update Action
# Updates the clown
patch '/coasters/:id' do
  @coaster = Coaster.find(params[:id])
  @coaster.update({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
    })
  redirect to ('/coasters/' + @coaster.id.to_s)
end

# Destroy Action
# Deletes Clown
delete '/coasters/:id' do
  coaster = Coaster.find(params[:id])
  coaster.destroy
  redirect to ('/coasters/' + @coaster.id.to_s)
end
