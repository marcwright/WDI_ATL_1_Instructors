require 'sinatra'
require 'sinatra/reloader'
require 'pry'


# get '/' do
#   salil = "hi"
#   "<h1>#{salil}</h1>"
# end

get "/coin_toss" do
  coin = rand(1..2)
  if coin == 1
    return "Heads!"
  else
    return "Tails!"
  end
end

get "/dice_roll" do
  "Rolling the dice.."
  return rand(1..6).to_s
end

get "/magic8ball/will%20it%20snow%20tomorrow" do
  responses = ["It is certain",
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
  "Very doubtful"]
  return responses.sample
end


get "/rps/rock" do
  computer = [1, 2, 3]
  choice = computer.sample
  if choice == 1
    return "Computer chose rock, it's a draw."
  elsif choice == 2
    return "Computer chose paper, you lose.."
  elsif choice == 3
    return "Computer chose scissors, you win!"
  end
end
