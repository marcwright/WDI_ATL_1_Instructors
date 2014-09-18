require 'sinatra'
require 'sinatra_reloader'

<<<<<<< HEAD


compliments = [
=======
@compliments = [
>>>>>>> 7d2e8f3738d4461928aff103ff5d90bf5755870c
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"
]

<<<<<<< HEAD
colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
=======
@colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
>>>>>>> 7d2e8f3738d4461928aff103ff5d90bf5755870c

get '/' do
  compliments.sample
end

get '/:name' do
<<<<<<< HEAD
  "Hey #{:name}! " + compliments.sample
=======
  "Hey #{params[:name]}! " + compliments.sample
>>>>>>> 7d2e8f3738d4461928aff103ff5d90bf5755870c
end
