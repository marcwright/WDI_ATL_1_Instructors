require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/coaster'



get '/' do
  erb :home
end

################## LIST ALL COASTERS
get '/coasters' do #lists coasters
  @coaster = Coaster.all
erb :'coasters/index'
end

################# CREATE A NEW COASTER
get '/coasters/new' do #gets the form to submit a new roller coaster
erb :'coasters/new'
end

post '/coasters' do # submits the created roller coaster
Coaster.create({name: params[:name], top_speed: params[:top_speed],
  min_height: params[:min_height], image_url: params[:image_url]})
end


##############  DISPLAY A SINGLE ROLLERCOASTER
get '/coasters/:id' do #displays a single rollercoaster, based on url
  @coaster = Coaster.find(params[:id])
  erb :'coasters/show'
end

##########  EDIT A COASTER
get '/coasters/:id/edit' do #gets the form to EDIT a new rollercoaster
@coaster = Coaster.find(params[:id])
erb :'coasters/edit'
end

patch '/coasters/:id' do # submits the edited rollercoaster
coaster = Coaster.find(params[:id])
coaster.update({name: params[:name], top_speed: params[:top_speed],
  min_height: params[:min_height], image_url: params[:image_url]})
end

############## DESTROY

delete '/coasters/:id' do
  coaster = Coaster.find(params[:id])
  coaster.destroy
 redirect to('/coasters')
end
