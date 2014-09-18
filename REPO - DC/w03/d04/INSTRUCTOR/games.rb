require 'sinatra'
require 'sinatra/reloader'
require 'pry'

coin = ["heads", "tails"]

get '/coin_toss' do
  return coin.sample
end

get '/dice_roll' do
  roll = 1 + rand(6)
  "You rolled a #{roll}"
end

magic_responses = [
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

get '/magic8ball/:question' do
  choice = 1 + rand(20)
  "You asked the question #{params[:question]}." +
  magic_responses[choice]
end

