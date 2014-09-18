require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/coin_toss' do
  coin = ["heads", "tails"].sample
  "<h1>#{coin}</h1>"
end

get '/dice_roll' do
  dice = [1, 2, 3, 4, 5, 6].sample
  "<h1>#{dice}</h1>"
end

get '/magic8ball/:question' do
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
].sample

  "<h1>#{params[:question]} #{response}</h1>"
end

get '/rps/:choice' do
  computer_choice = ["rock", "paper", "scissors"].sample
  your_choice = params[:choice]

  outcome = {
    "rock" => "scissors",
    "scissors" => "paper",
    "paper" => "rock"
  }
  if your_choice == computer_choice
    "<h1>The computer chose #{computer_choice}. You tie.</h1>"
  elsif outcome[your_choice] == computer_choice
    "<h1>The computer chose #{computer_choice}. <p>You win!! :D</p></h1>"
  else
    "<h1>The computer chose #{computer_choice}. <p>You lose! :(</p></h1>"
  end

end
