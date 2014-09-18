require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  return "<h1>coffee, <break>lunch, drunk<h1>"
end

get '/greet/:name/:fav_food' do
  if params[:name] == "Jon"
    "What's up #{params[:name]}"
  else
    "What up, #{params[:name]} let's some eat #{params[:fav_food]}"
  end
end

