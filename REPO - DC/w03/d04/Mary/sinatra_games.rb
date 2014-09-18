require 'sinatra'
require 'sinatra/reloader'

get '/coin_toss' do
  coin = ["heads","tails"]
  coin.sample
end

get '/dice_roll' do
  (rand(6) + 1).to_s
end

get '/magic8ball/:question' do
  answers =  [
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
  "#{params[:question].capitalize}? #{answers.sample}"
end

get '/rps/rock' do
  pair_choice = rand(3)
  choices = [{"rock" => "tie"}, {"paper" => "lose"}, {"scissors" => "win"}]

  "The computer chose #{choices[pair_choice].keys[0]}. You #{choices[pair_choice].values[0]}"
end
