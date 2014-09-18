require 'sinatra'
require 'sinatra/reloader'



get '/' do
  @compliments = [
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"
]
  @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
  erb :compliment
end

get '/:name' do
  @compliments = [
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"
]
  @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
  @name = params[:name].capitalize
  erb :compliment
end

post '/add_compliment' do
  @compliments.push(params[:compliment])
end
