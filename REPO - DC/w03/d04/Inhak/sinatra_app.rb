require 'pry'
require 'sinatra'
require 'sinatra/reloader'

#The get is like the method type it is a request, the '/' is the relative path and its like a argument
get '/' do
  four = 2*2
  trav = "trav laurens-arthur vanderhoop"
  "<h1>#{trav}</h1>"
end

get '/coffee/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey #{params[:name]}, heard it's your birthday. Want some #{params[:fav_food]}"
  else
    "what up, #{params[:name]}, let's eat some #{params[:sport]} "
  end
end

get '/lunch/' do
  "<p>I like eating lunch</p>"
end

get '/drunk/' do
  "<h3> get lucky </h3>"
end

