require 'sinatra'

get '/coin_toss' do
  flip = ["Heads", "Tails"]
  flip.sample
end

get '/dice_roll' do
  rand(1..6).to_s
end

get '/magic8ball/:question' do
  responses = [
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
  return "#{params[:question].capitalize}? #{responses.sample}."

end

get '/rps/:rock' do
  moves = ["rock", "paper", "scissors"]
  computer_choice = moves.sample
  case computer_choice
    when "rock" then "Computer chose 'rock'. It's a tie."
    when "paper" then "Computer chose 'paper'. You lose."
    when "scissors" then "Computer chose 'scissors'. You win!"
  end
end
