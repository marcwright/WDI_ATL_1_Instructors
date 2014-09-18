require 'sinatra'
require 'sinatra/reloader'

get "/coffee" do
  "hello word"
end

get "/lunch" do
  "nom nom nom"
end

get "/drunk" do
  "blerggghzzZZZzz"
end

get '/greetings/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey #{params[:name]}, heard it's your birthday. Want some #{params[:fav_food]}?"
  else
    "What's up #{params[:name]}?"
  end
end
