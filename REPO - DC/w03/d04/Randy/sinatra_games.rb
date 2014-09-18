require 'sinatra'
require 'sinatra/reloader'

get '/coin_toss'  do
  coin = ["Heads", "Tails"]
  if coin.sample == "Heads"
    "<img src = 'http://www.marshu.com/articles/images-website/articles/presidents-on-coins/half-dollar-coin-head.jpg' />"
  else
    "<img src = 'http://www.marshu.com/articles/images-website/articles/presidents-on-coins/half-dollar-coin-tail.jpg' />"
  end
end

get '/dice_roll'  do
  result = (1..6).to_a.sample
  if result == 1
    "<img src = 'http://game-icons.net/icons/delapouite/dice/png/dice-six-faces-one.png'/>"
  elsif result == 2
    "<img src = 'http://game-icons.net/icons/delapouite/dice/png/dice-six-faces-two.png' />"
  elsif result == 3
    "<img src = 'http://game-icons.net/icons/delapouite/dice/png/dice-six-faces-three.png />"
  elsif result == 4
    "<img src = 'http://game-icons.net/icons/delapouite/dice/png/dice-six-faces-four.png' />"
  elsif result == 5
    "<img src = 'http://game-icons.net/icons/delapouite/dice/png/dice-six-faces-five.png' />"
  elsif result == 6
    "<img src = 'http://game-icons.net/icons/delapouite/dice/png/dice-six-faces-six.png' />"
  end
end

get '/magic8ball/:question'  do
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
"<h1> My response is to your question:
<p>'#{params[:question]}?' is . . .</p>
 <p>#{eight_ball.sample}...</p>"
end

get '/rps/rock'  do
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






  # rps = ["rock", "paper", "scissors"]
  # computer_pick = rps.sample
  # if computer_pick == "paper"
  #   "<style> h1{color:green;
  #               font-weight:700}; </style>
  #   <img src = 'http://greenbusinessmatters.com/wp-content/uploads/2013/08/paper.gif' />
  #   <h1>I choose #{computer_pick}. You lose!</h1>"
  # elsif computer_pick == "scissors"
  #   "<style> h1{color:red;
  #               font-weight:700}; </style>
  #     <img src = 'http://www.tweezerman.com/uploaded_files/images/products/b_6320733628686da67fde9e36922355287200_Scissors.jpg' />
  #     <h1>I choose #{computer_pick}. You win, Dammit!</h1>"
  # else
  #   "<img src = 'http://www.domenlo.com/wp-content/uploads/domenlo/tutorial_images/geci_rock-stone_03.jpg' />
  #   <h1>I choose #{computer_pick}. We tied, you are a worthy opponent.</h1>"
  # end
end
