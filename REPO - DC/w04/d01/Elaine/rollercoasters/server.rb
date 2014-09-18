require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/rollercoaster'

get '/' do
  erb :home
end

# Index Action
# Read all of the clowns
get '/rollercoasters' do
  @rollercoasters = Rollercoaster.all
  erb :'rollercoasters/index'
end

# New Action
# Displays a form for creating a clown
get '/rollercoasters/new' do
  erb :'rollercoasters/new'
end

# Create Action
# Creates the clown
post '/rollercoasters' do
  rollercoaster = Rollercoaster.create(
  {
    name: params[:name],
    top_speed: params[:top_speed],
    min_height: params[:min_height],
    image_url: params[:image_url]
  })
  redirect to('/rollercoasters/' + rollercoaster.id.to_s)
end

# Show Action
# Displays a single clown
get '/rollercoasters/:id' do
  @rollercoaster = Rollercoaster.find(params[:id])
  erb :'rollercoasters/show'
end


# Edit Action
# Displays a form to Edit
get '/rollercoasters/:id/edit' do
  @rollercoaster = Rollercoaster.find(params[:id])
  erb :'rollercoasters/edit'
end

# Update Action
# Updates the clown
patch '/rollercoasters/:id' do
  rollercoaster = Rollercoaster.find(params[:id])
  rollercoaster.update({
    name: params[:name],
    top_speed: params[:top_speed],
    min_height: params[:min_height],
    image_url: params[:image_url]
  })
  redirect to('/rollercoasters/' + rollercoaster.id.to_s)
end

# Destroy Action
# Deletes the Clown
delete '/rollercoasters/:id' do
  rollercoaster = Rollercoaster.find(params[:id])
  rollercoaster.destroy
  redirect_to('/rollercoasters')
end
