require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/coaster'

get '/' do
  erb :home
end

#Index Action
#Read all of the coasters
get '/coasters' do
  @coaster = Coaster.all
  erb :'coasters/index'
end

#New Action
#Displays a form for creating a coaster
get '/coasters/new' do
  erb :'coasters/new'
end

post '/coasters' do
  coaster = Coaster.create({name: params[:name], top_speed: params[:top_speed].to_s, min_height: params[:min_height].to_s, image_url: params[:image_url]})
  redirect to('/coasters/' + coaster.id)
end
