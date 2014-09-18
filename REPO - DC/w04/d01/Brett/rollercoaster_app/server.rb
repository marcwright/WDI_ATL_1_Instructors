require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/rollercoaster'

get '/' do
  erb :home
end

# INdex Action
# Read all of the clowns
get '/rollercoasters' do
  @rollercoasters = RollerCoaster.all
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
  rollercoaster = RollerCoaster.create(
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
    )
  redirect to ('/rollercoasters/' + rollercoaster.id.to_s )
end

# Show action
# Displays a single clown
get '/rollercoasters/:id' do
  @rollercoaster = RollerCoaster.find(params[:id])
  erb :'/rollercoasters/show'
end

# Edit Action
# Displays a form to Edit

get '/rollercoasters/:id/edit' do
  @rollercoaster = RollerCoaster.find(params[:id])
  binding.pry
  erb :'/rollercoasters/edit'
end

patch '/rollercoasters/:id' do
  rollercoaster = RollerCoaster.find(params[:id])
  rollercoaster.update({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
    })
  redirect to('/rollercoasters/' + rollercoaster.id.to_s )
end

delete '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect to('/koopas')
end
