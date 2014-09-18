require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/coin_toss' do
  coin = ["Heads", "Tails"]
  if coin = "Heads"
  return <img src ="http://media1.s-nbcnews.com/i/newscms/2014_08/202636/dogecoin_dce1cafbbbc0db017f839f11970703b8.jpg">
else
end
end

get '/dice_roll' do
  dice = (1..6).to_a
  return dice.sample.to_s
end

get '/magic8ball/:questions' do

  decisions = [
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
return "<h1>#{params[:questions]}?</h1>" + decisions.sample
end


get '/rps/:choice' do
  rps = ["Rock" , "Paper" , "Scissor"]

  computer_choice = rps.sample
  user_choice = params[:choice]

  beats = { "Rock" => "Scissor", "Paper" => "Rock", "Scissor" => "Paper" }

    if computer_choice == user_choice
      return "A TIE! Computer chose #{computer_choice} and You chose #{params[:choice]}"
    elsif beats[computer_choice] == user_choice
      return "YOU WIN! Computer chose #{computer_choice} and You chose #{params[:choice]}"
    else
      return "YOU Lose! Computer chose #{computer_choice} and You chose #{params[:choice]}"
    end
end

  # case
  # when user_choice == computer_choice
  #   return "A TIE! Computer chose #{computer_choice} and You chose #{params[:choice]}"
  # when user_choice == 'Rock' && computer_choice == "Scissor"
  #   return "YOU WIN! Computer chose #{computer_choice} and You chose #{params[:choice]}"
  # when user_choice == 'Rock' && computer_choice == "Paper"
  #   return "YOU LOSE! Computer chose #{computer_choice} and You chose #{params[:choice]}"
  # when user_choice == 'Scissor' && computer_choice == "Paper"
  #   return "YOU WIN! Computer chose #{computer_choice} and You chose #{params[:choice]}"
  # when user_choice == 'Scissor' && computer_choice == "Rock"
  #   return "YOU LOSE! Computer chose #{computer_choice} and You chose #{params[:choice]}"
  # when user_choice == 'Paper' && computer_choice == "Rock"
  #   return "YOU WIN! Computer chose #{computer_choice} and You chose #{params[:choice]}"
  # when user_choice == 'Paper' && computer_choice == "Scissor"
  #   return "YOU WIN! Computer chose #{computer_choice} and You chose #{params[:choice]}"
  # else
  #   "ERROR"
  # end



