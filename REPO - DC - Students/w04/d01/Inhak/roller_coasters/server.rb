require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative "./models/rollercoaster"
require_relative "./models/config"

get "/" do
  erb :index
end

get "/rollercoasters" do
  @rollercoasters = RollerCoaster.all
  erb :'rollercoasters/index'
end

get '/rollercoasters/new' do
  erb :'rollercoasters/new'
end

post '/rollercoasters' do

  @min_height =(12 * params[:feet].to_i) + (params[:inches].to_i)
  rollercoaster = RollerCoaster.create(
    name: params[:name],
    min_height: @min_height,
    top_speed: params[:speed],
    image_url: params[:image_url]
  )
  redirect to("/rollercoasters/" + rollercoaster.id.to_i)
end

get '/clowns/:id/edit' do
  @
