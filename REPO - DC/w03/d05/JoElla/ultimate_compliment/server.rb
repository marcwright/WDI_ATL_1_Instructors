require 'sinatra'
require 'sinatra/reloader'

compliments = [
    "Your instructors love you",
    "High five = ^5",
    "Is it Ruby Tuesday yet?",
    "It's almost beer o'clock",
    "The Force is strong with you"
  ]

colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]

get '/' do
  @random_compliment = compliments.sample
  @color = colors.sample
  erb :compliment
end

get '/:name' do
  @name = params[:name]
  @random_compliment = compliments.sample
  @color = colors.sample
  erb :compliment
end

post '/user_compliment' do
  compliments.push(params[:user_comp])
end
