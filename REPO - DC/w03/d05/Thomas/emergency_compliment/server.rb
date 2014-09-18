require 'sinatra'
require 'sinatra/reloader'

$colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]

$compliments = [
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"]

get '/' do
  erb :index
end

get "/:name" do
  @name = params[:name].capitalize
  erb :compliment
end

post "/add" do
  $compliments.push(params[:nice_phrase])
end
