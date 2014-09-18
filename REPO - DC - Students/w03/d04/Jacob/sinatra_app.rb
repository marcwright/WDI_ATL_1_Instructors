require 'sinatra'
require 'sinatra/reloader'
require 'pry'
#the format mirrors a block being called:
#request type (get) + relative path ('/') do
#end

get '/' do
  trav = "trav laurens-arthur vanderhoop"
  "<h1>#{trav}</h1>"
end

get '/greet/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey #{params[:name]}, heard it's your birthday.  Want some #{params[:fav_food]}?"
  else
    "What up, #{params[:name]}, let's eat some #{params[:fav_food]}."
  end
end


