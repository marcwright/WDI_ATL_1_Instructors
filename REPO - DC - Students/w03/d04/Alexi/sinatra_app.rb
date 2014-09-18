require 'sinatra'
require 'sinatra/reloader'
require 'pry'

magic_array = [ "It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful" ]

get '/greetings/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey #{params[:name]}, heard its your birthday. Want some #{params[:fav_food]} ?"
  else
    "What up, #{params[:name]}, lets eat some #{params[:fav_food]}"
  end
end

get '/magic8ball/will%20it%20snow%20tomorrow' do
  question = "Will it snow tomorrow? "
  question + magic_array.sample
end

get '/coin_toss' do
  toss = ["heads","tails"]
  toss.sample
end


get '/dice_roll' do
  roll = (1..6).to_a.sample.to_s
end

get 'rps/rock' do
  rps = [rock, paper, scissors]
  

end




