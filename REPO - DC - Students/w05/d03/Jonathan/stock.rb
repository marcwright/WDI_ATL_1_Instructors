require 'pry'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'

get '/' do

  if params[:symbol]
    @stock_symbol = params[:symbol]
    response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{@stock_symbol}")
    response_hash = JSON(response)
    @last_price = response_hash["Data"]["LastPrice"]
  end

  erb :index
end
