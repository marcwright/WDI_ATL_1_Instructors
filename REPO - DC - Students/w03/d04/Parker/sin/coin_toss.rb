require 'sinatra'
require 'sinatra/reloader'

# get '/coin_toss' do
# 	<h1>coin_toss = ["heads", "tails"]<h/1>
# 	coin_toss = coin_toss.shuffle[0]
# end

get '/coin_toss'  do
  coin = ["Heads", "Tails"]
  if coin.sample == "Heads"
    "<img src = 'http://www.marshu.com/articles/images-website/articles/presidents-on-coins/half-dollar-coin-head.jpg' />"
  else
    "<img src = 'http://www.marshu.com/articles/images-website/articles/presidents-on-coins/half-dollar-coin-tail.jpg' />"
  end
end