require "sinatra"
require "sinatra/reloader"
require "pry"

get '/' do
  '<h2>Games?</h2>
  <ul>
  <li><a href="/coin_toss">Toss coins</a></li>
  <li><a href="/dice_roll">Dice</a></li>
  <li><a href="/magic8ball/will-it-snow-tomorrow">8 Ball</a></li>
  <li><a href="/lunch">RPS</a></li>
  </ul>
  '
end

get '/coin_toss' do
  coin = ["heads", "tails"]
  "<h1>We just flipped a coin for you!!!</h1>
  <p>You got: #{coin.sample}</p>"
end

get '/dice_roll' do
  dice = (1..6).to_a
  "<h1>We just rolled a dice for you!!!</h1>
  <p>You got: #{dice.sample}</p>"
end

get '/magic8ball/:question' do
  eightball_answer = [
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
  "Very doubtful"]

  "#{params[:question]}?<br />#{eightball_answer.sample}"

end


