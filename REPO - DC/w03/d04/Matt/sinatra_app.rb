require "sinatra"
require "sinatra/reloader"
require "pry"

get '/' do
  '<h2>Ayo</h2>
  <p>Give me money</p>
  <input></input>
  <button>$$$</button>
  <a href="/lunch">see lunch menu</a>'
end

get '/lunch' do
  name = gets.chomp
  '<h1>Food</h1>
  <input>#{name}</input>'
end

get '/greet/:name/:fav_food' do
  if params[:name] == "me"
    "Hey #{params[:name]}, let's ear some #{params[:fav_food]}"
  else
    "What up"
  end
end


