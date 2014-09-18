require 'sinatra'
require 'sinatra/reloader'
require 'pry'

compliments =["You're a lovely person.",
  "You're awesome.",
  "You're incredible.",
  "You're absolutely amazing.",
  "You're fantastic.",
  "You're a very nice person.",
  "You're very cool.",
  "You seem very nice.",
  "You seem very cool.",
  "You're a sweet person.",
  "You have a beautiful personality.",
  "From what I see, hands down, you're amazing.",
  "I love your personality!",
  "You're such a person to look up to.",
  "Your heart is huge.",
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"]

@colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
@sample = @colors.sample

get '/' do
  @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
  @sample = @colors.sample
  erb :index
end


get '/compliment/*' do
  @rand_comp = compliments.sample.downcase.to_s
      @name= params[:splat].join("<br >")
    @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
    @sample = @colors.sample
 erb :compliment
end

get '/happy' do
  @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
  @sample = @colors.sample
  erb :happy
end

post '/compliment/add' do
  @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
    @sample = @colors.sample
  new_compliment = params[:comp]
  compliments.push(new_compliment)
end
