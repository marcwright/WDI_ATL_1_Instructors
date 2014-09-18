# - GET `/coin_toss`
#   - returns "Heads" or "Tails"
# - GET `/dice_roll`
#     - returns a number between 1 and 6
# - GET `/magic8ball/will%20it%20snow%20tomorrow`
#   - returns the question asked (in this case, "Will it snow tomorrow?"), followed by a random magic 8 ball response (see below)
# - GET `/rps/rock`
#   - returns the computer's random choice, followed by the outcome of the rps game.
#       - __Example:__ "The computer chose (computer's choice). You (win/lose/tie)!"

require "sinatra"
require "sinatra/reloader"

get "/coin_toss" do
  ["Heads", "Tails"].sample
end

get "/dice_roll" do
  rand(1..6).to_s
end

get "/magic8ball/:question" do |question|
  # Prints the question given in the URL with proper capitalization and punctuation
  # Randomly choose an answer based on a pre-generated list of responses
  possible_responses = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]

  formatted_question = question[-1] == "?" ? question.capitalize : question.capitalize + "?"
  random_answer = possible_responses.sample
  "<p>
    #{ formatted_question }<br />
    #{ random_answer }
  </p>"
end

get "/rps/:rps_choice" do |rps_choice|
  # Randomly pick rock, paper, scissors.
  # Given the user's choice of either rock, paper scissors, announce if the user won the game or not.

  # Hash representing winning conditions for the user
  # { user's selection => computer's selection }
  win_condition = {
    rock: "scissors",
    paper: "rock",
    scissors: "paper"
  }

  img_src = {
    rock: 'http://graphics8.nytimes.com/images/2011/08/21/magazine/21mag-abstractimages-slide-XOE4/21mag-abstractimages-slide-XOE4-jumbo.jpg',
    paper: 'http://graphics8.nytimes.com/images/2011/08/21/magazine/21mag-abstractimages-slide-2T4N/21mag-abstractimages-slide-2T4N-jumbo.jpg',
    scissors: 'http://graphics8.nytimes.com/images/2011/08/21/magazine/21mag-abstractimages-slide-IRQ1/21mag-abstractimages-slide-IRQ1-jumbo.jpg'
  }

  computer_rps = ["rock", "paper", "scissors"].sample   # computer randomly selects rock, paper, scissors
  user_rps = rps_choice.downcase                        # use only lowercase letters to match against our winning conditions

  # calculate result
  # also set the text color of the result to green or red, based on if they win or lose
  case
  when user_rps == computer_rps
    game_result = "It's a tie."
    result_color = "#180615"
  when win_condition[user_rps.to_sym] == computer_rps
    game_result = "You won!"
    result_color = "#01A368"
  when win_condition[computer_rps.to_sym] == user_rps
    game_result = "You lost."
    result_color = "#D6002D"
  end

  "
  <style>
    .rps_container {
      float: left;
      margin: 0 10px;
    }
    .choices {
      text-align: center;
      font-weight: bold;
      font-size: 24px;
    }
    #result {
      z-index: 100;
      position: absolute;
      top: 75px;
      left: 25%;
      right: 25%;
      font-size: 50px;
      -webkit-transform: rotate(-45deg);
      -moz-transform: rotate(-45deg);
      -ms-transform: rotate(-45deg);
      color: #{ result_color }
    }
  </style>
  <div class='rps_container'>
    <div class='choices'>You chose:</div>
    <div><img src=#{ img_src[user_rps.to_sym] }></div>
  </div>
  <div class='rps_container'>
    <div class='choices'>The computer chose:</div>
    <div><img src=#{ img_src[computer_rps.to_sym] }></div>
  </div>
  <br clear='both' />
  <div id='result'>
    #{ game_result }
  </div>
  "
end
