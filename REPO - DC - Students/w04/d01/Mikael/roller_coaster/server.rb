require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/roller_coaster'

get '/' do
  erb :home
end

 # Index Action
 # Read all of the rides
get '/rides' do
  @rides = RollerCoaster.all
  erb :'roller_coasters/index'
end

  # New Action
  # Displays a form for creating a ride.

get '/rides/new' do
  erb :'roller_coasters/new'
end

  # Create Action
  # Creates the ride
post '/rides' do
  ride = RollerCoaster.create({
    name: params[:name],
    top_speed: params[:top_speed].to_i,
    min_height: params[:min_height].to_i,
    image_url: params[:image_url]
    })
  redirect to('/rides/' + ride.id.to_s)
end

  # Show Action
  # Displays a single ride

get '/rides/:id' do
  @ride = RollerCoaster.find(params[:id])
  erb :'roller_coasters/show'
end

  # Edit Action
  # Displays a form to edit
get '/rides/:id/edit' do
  @ride = RollerCoaster.find(params[:id])
  erb :'roller_coasters/edit'

end

  # Update Action
  # Updates the ride

patch '/rides/:id' do
  ride = RollerCoaster.find(params[:id])
  ride.update({
    name: params[:name],
    top_speed: params[:top_speed],
    min_height: params[:min_height],
    image_url: params[:image_url]
    })
  redirect to('/rides/' + ride.id.to_s)
end

  # Destroy action
  # Deletest the ride

delete '/rides/:id' do
  ride = RollerCoaster.find(params[:id])
  ride.destroy
  redirect to('/rides')
end
# # binding.pry
