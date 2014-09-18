require 'sinatra'
require 'sinatra/reloader'

get '/coin_toss' do
  ["Heads","Tails"].sample
end

get '/dice_roll' do
  "#{rand(6) + 1}"
end

get '/magic8ball/:question' do
  eightball = [
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
  "#{params[:question]} #{eightball.sample}"
end


get '/rps/:player' do
  computer = ["rock", "paper", "scissors"]
  wins = { rock: "paper", paper: "scissors", scissors: "rock"}

  opponent = computer.sample

  if opponent == params[:player]
    return "The computer chose #{opponent}. It's a tie!"
  elsif wins[params[:player].to_sym] == opponent
    return "The computer chose #{opponent}. You lose!"
  else
    return "The computer chose #{opponent}. You win!"
  end
end
