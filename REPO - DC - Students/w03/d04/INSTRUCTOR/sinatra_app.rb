require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  trav = "trav laurens-arthur vander hoop"
  "<h1>#{trav}</h1>"
end

get '/greetings/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey #{params[:name]}, heard it's your birthday. Want some #{params[:fav_food]}?"
  else
    "What up, #{params[:name]}, let's some eat #{params[:fav_food]}"
  end
end
