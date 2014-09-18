require 'sinatra'
require 'sinatra/reloader'

compliments = [
  "Your instructors love you",
  "Are you on a diet? You look great!",
  "You're the smartest student.",
  "The Force is strong with you",
  "You are lookin' good!",
  "You write the most beautiful code!"
]
colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]

get '/' do
  @background = colors.sample
  @random_compliment = compliments.sample
  erb :compliment
end

get '/:name' do
  @background = colors.sample
  @random_compliment = compliments.sample
  @name = params[:name]
  erb :compliment
end


