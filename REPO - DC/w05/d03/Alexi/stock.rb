require 'pry'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  
  if !params[:symbol].nil? 
    stock_symbol = params[:symbol]
    response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{stock_symbol}")
    song     = HTTParty.get("http://a1986.phobos.apple.com/us/r1000/085/Music/v4/82/94/0c/82940c99-bae7-5d25-b4e4-e835769133ec/mzaf_7849473511573947167.m4a")
    response_hash = JSON(response)
    @stock_name   = response_hash["Data"]["Name"]
    @stock_symbol = response_hash["Data"]["Symbol"]
    @last_price   = response_hash["Data"]["LastPrice"]
    @high_price   = response_hash["Data"]["High"]
    @low_price    = response_hash["Data"]["Low"]

    song_hash     = JSON(response)
    # @num_shares   = 
    @shares       = (response_hash["Data"]["MarketCap"] / @last_price).to_i
  end

  erb :index
end



