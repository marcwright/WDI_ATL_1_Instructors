require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/coin_toss' do
  coin = ["Heads", "Tails"]
  return coin.sample
end

get '/dice_roll' do
  dice = Array(1..6)
  return dice.sample.to_s
end

get '/magic8ball/will%20it%20snow%20tomorrow' do
  response = [
    "It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes definitely",
    "You may rely on it",
    "As I see it yes",
    "Most likely",
    "Outlook good",
    "Yes", "Signs point to yes",
    "Reply hazy try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"
  ]
  return "<h1>Will it snow tomorrow?</h1>" + response.sample
end

get '/rps/rock/:choice' do
  rps = ["Rock", "Paper", "Scissors"]
  computer_choice = rps.sample
  user_choice = params[:choice]
  if rps.index(user_choice).to_i-1 == rps.index(computer_choice).to_i
    return "Computer chose #{computer_choice}, you lose!"
  elsif rps.index(user_choice) == rps.index(computer_choice)
    return "Computer chose #{computer_choice}, the game is tied!"
  elsif rps.index(user_choice).to_i+1 == rps.index(computer_choice).to_i
    return "Computer chose #{computer_choice}, you win!"
  else
    "error"
  end
end
