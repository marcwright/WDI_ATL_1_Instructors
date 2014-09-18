require 'sinatra'
require 'sinatra/reloader'

@compliments = [
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"
]

get '/' do
  erb :index
end

get '/verse/:bottles' do
  @bottles = params[:bottles].to_i

  if @bottles >= 0
    @plural = @bottles > 1
    erb :verse
  else
    redirect "/"
  end
end

get '/refrain/:bottles' do
  @bottles = params[:bottles].to_i
  @next = @bottles - 1
  erb :refrain
end
