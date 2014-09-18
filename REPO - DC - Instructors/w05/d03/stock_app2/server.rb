require 'sinatra'
require 'sinatra/reloader'
require 'erb'
require 'httparty'
require 'pry'

get "/" do
  if params[:stock_symbol]
    @stock_symbol = params[:stock_symbol].upcase
    response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{@stock_symbol}")
    response_hash = JSON(response)
    @last_price = response_hash["Data"]["LastPrice"]
  end

  erb :index
end