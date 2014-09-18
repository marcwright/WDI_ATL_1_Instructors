require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/coin_toss' do
  coin = rand(2)
  if coin.even?
    #"Heads"
    "<img src='http://blog.stsaint.com/philosophy/wp-content/uploads/2010/07/Quarter-heads-300x300.jpg'>"
  else
    #"Tails"
    "<img src='http://www.theus50.com/images/state-quarters/quarter-bicentennial.jpg'>"
  end
end

get '/dice_roll' do
  roll = 1 + rand(6)
  "You rolled a #{roll}."
end

get '/rps/rock' do
  compchoice = 1 + rand(3)
  if compchoice == 1
    "You chose rock. Computer chose rock. It's a TIE!"
  elsif compchoice == 2
    "You chose rock. Computer chose paper. YOU LOSE."
  else
    "You chose rock. Computer chose scissors. You WIN!"
  end
end

get '/rps/paper' do
  compchoice = 1 + rand(3)
  if compchoice == 1
    "You chose rock. Computer chose rock. It's a TIE!"
  elsif compchoice == 2
    "You chose rock. Computer chose paper. YOU LOSE."
  else
    "You chose rock. Computer chose scissors. You WIN!"
  end
end

get '/rps/scissors' do
  compchoice = 1 + rand(3)
  if compchoice == 1
    "You chose rock. Computer chose rock. It's a TIE!"
  elsif compchoice == 2
    "You chose rock. Computer chose paper. YOU LOSE."
  else
    "You chose rock. Computer chose scissors. You WIN!"
  end
end






get '/magic8ball/:question' do
  choice = 1 + rand(20)

  answers = [ "It is certain", "It is decidedly so",
    "Without a doubt", "Yes definitely",
    "You may rely on it", "As I see it yes",
    "Most likely", "Outlook good",
    "Yes", "Signs point to yes",
    "Reply hazy try again", "Ask again later",
    "Better not tell you now", "Cannot predict now",
    "Concentrate and ask again", "Don't count on it",
    "My reply is no", "My sources say no", "Outlook not so good",
    "Very doubtful" ]

    "You asked the question: #{params[:question]}. My answer?..." +
    " #{answers[choice]}. Bwahahah!"
end


