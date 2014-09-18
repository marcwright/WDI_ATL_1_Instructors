require 'pry'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'

get '/' do

    @stock_symbol = params[:symbol]
    response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{@stock_symbol}")
    response_hash = JSON(response)


  if response_hash["Data"] && response_hash["Data"]["Status"] == "SUCCESS"
    @last_price = response_hash["Data"]["LastPrice"]
    @high = response_hash["Data"]["High"]
    @low = response_hash["Data"]["Low"]
    @num_shares = (response_hash["Data"]["MarketCap"])/(@last_price)
  else
      @error = response_hash["Message"]
  end

  erb :index
end




