require 'sinatra'
require 'sinatra/reloader'
require 'pry'



# get '/coin_toss' do
#   coin = Random.new(1, 2)
#   return coin
# end

get '/coin_toss' do

  coin = rand(2)

  if coin == 0
    return "<img src= 'http://coins.silvercoinstoday.com/wp-content/uploads/2010/10/America-the-Beautiful-Silver-Coin-Obverse.jpg'>"
  else
    return "<img src= 'http://www.marshu.com/articles/images-website/articles/presidents-on-coins/half-dollar-coin-tail.jpg'>"
  end

  # return coin
end

get '/dice_roll' do
  dice = ["1", "2", "3", "4", "5", "6"]
  # dice_arry = dice.each
  return dice.sample
end
