require 'pry'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  if params[:symbol]
    @stock_symbol = params[:symbol]
    response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{@stock_symbol}")
    #HTTParty allows the integration of ruby interpolation and HTTP requests.
    response_hash = JSON(response)

    if response_hash["Data"] && response_hash["Data"]["Status"]=="SUCCESS"
      @last_price = response_hash["Data"]["LastPrice"]
      @high_price = response_hash["Data"]["High"]
      @low_price = response_hash["Data"]["Low"]
      @num_shares = (response_hash["Data"]["MarketCap"]/@last_price).to_i
    else
      @error = response_hash["Message"]
    end
  end

  erb :index
end



