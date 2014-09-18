require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  trav = "trav laurens-arthur"
  "<h1>#{trav}</h1>"
end

get '/greetings/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey #{params[:name]}, happy birthday. Want some #{params[:fav_food]}"
  else
    "Hi #{params[:name]}, let's have some #{params[:fav_food]}"
  end

end
