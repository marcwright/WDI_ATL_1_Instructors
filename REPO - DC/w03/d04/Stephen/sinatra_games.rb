# Stephen Stanwood (stephen@stanwoodsolutions.com)

require 'sinatra'
require 'sinatra/reloader'

RESPONSES = [
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

RPS_CHOICES = [:rock, :paper, :scissors]
RPS_COLORS = { win: "green", lose: "red", tie: "yellow" }
RPS_IMAGES = { rock: "http://goo.gl/YuLuAu", paper: "http://goo.gl/B0qU8n", scissors: "http://goo.gl/Hgm2ry" }
RPS_RESULTS = { rock: { rock: "tie", paper: "lose", scissors: "win" },
                paper: { rock: "win", paper: "tie", scissors: "lose" },
                scissors: { rock: "lose", paper: "win", scissors: "tie" } }

get '/coin_toss' do
  return rand(2) == 0 ? "Heads" : "Tails"
end

get '/dice_roll' do
  return (1 + rand(6)).to_s
end

get '/magic8ball/will%20it%20snow%20tomorrow' do
  return "Will it snow tomorrow?<br />" + RESPONSES.sample
end

get '/rps/:choice' do
  choice_sym = RPS_CHOICES.sample
  res_sym = RPS_RESULTS[params[:choice].to_sym][choice_sym].to_sym

  text = "<div style='text-align: center'>
          <h1 style=\"font-size: 96px; color: #{RPS_COLORS[res_sym]}\">
          Deep Blue chose #{choice_sym.to_s}.</h1>
          <img height='400' src='#{RPS_IMAGES[choice_sym]}' />
          <h1 style=\"font-size: 96px; color: #{RPS_COLORS[res_sym]}\">You #{res_sym.to_s}!</h1>
          </div>"

  return text
end
