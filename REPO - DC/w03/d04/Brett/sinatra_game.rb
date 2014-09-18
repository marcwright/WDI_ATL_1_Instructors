require 'sinatra'
require 'sinatra/reloader'

get "/coin_toss" do
  ["head", "tail"].sample
end

get "/dice_roll" do
  rand(1..6).to_s
end

get "/magic8ball/:question" do
  eight_ball = [
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
  "#{params[:question].capitalize}? #{eight_ball.sample}."
end

get "/rps/rock" do
  computer_choice = ["rock", "paper", "scissors"].sample
  case computer_choice
  when "rock" then "The computer chose #{computer_choice}. You tie!"
  when "paper" then "The computer chose #{computer_choice}. You lose!"
  when "scissors" then "The computer chose #{computer_choice}. You win!"
  # "The computer chose #{computer_choice}. You tie!" if computer_choice == params[:player_choice]
  # "The computer chose #{computer_choice}. You win!" if computer_choice ==

  else
  end
end
