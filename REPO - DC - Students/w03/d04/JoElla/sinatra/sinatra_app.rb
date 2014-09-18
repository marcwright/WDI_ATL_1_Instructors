require 'sinatra'
require 'sinatra/reloader'

# get '/greetings/:name/:fav_food' do
#   if params[:name] == 'mary'
#     "Hey #{params[:name]} want #{params[:fav_food]}"
#   else
#     "Hey #{params[:fav_food]}"
#   end
# end


get '/coin_toss' do
  coin = ["heads","tails"]
  coin.sample
end

get '/dice_roll' do
  rand(6).to_s
end

get '/magic8ball/:question' do
  answers = [
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

"#{params[:question]} #{answers.sample}"

end

get '/rps/:move' do
  compmove = rand(3)
  if compmove == 1
    cmove = "rock"
  elsif compmove == 2
    cmove = "paper"
  else cmove = "scissors"
  end
 "You played #{params[:move]}, the computer played #{cmove}"

 winners = {"rock" => "scissors"}


end
