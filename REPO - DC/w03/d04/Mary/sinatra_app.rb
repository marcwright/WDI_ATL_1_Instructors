require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# looks like a method call being passed an argument & a method
# request type (i.e. get) + relative path ('/..') do

# end

get '/' do
  "<h1>hello world</h1>"
end

#if get request is made to this path, run code in block
# :name is a variable that gets sucked into hash of parameters aka PARAMS
# PARAMS is where data that browswer sends over is housed
get '/greetings/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey, #{params[:name]}, want some #{params[:fav_food]}?"
  else
    "What up #{params[:name]} let's eat some #{params[:fav_food]}."
  end

end

