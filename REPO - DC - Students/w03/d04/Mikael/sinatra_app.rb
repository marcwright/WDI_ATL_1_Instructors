require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  four = 2*2
  trav = "trav"
  "<h1>Hello, world!</h1>"
end

get '/coffee' do
  "There is a Starbucks down the street."
end

get '/lunch' do
  "FRESHII!!!!"
end

get '/drunk' do
  "Party party party let's all get wasted"
end

get '/greet/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey #{params[:name]}, heard it's your birthday. Want some #{params[:fav_food]}?"
  else
    "What up, #{params[:name]}, let's eat some #{params[:fav_food]}"
  end
end
