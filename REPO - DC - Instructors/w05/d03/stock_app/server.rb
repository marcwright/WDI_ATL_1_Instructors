require 'sinatra'
require 'sinatra/reloader'
require 'erb'
require 'httparty'
require 'pry'

get "/" do
  if params[:stock_symbol]
    @stock_symbol = params[:stock_symbol].upcase
  
    response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{@stock_symbol}")

    if response["Data"].nil?
      @error = response["Message"]
    else
      @last_price = response["Data"]["LastPrice"]
    end
  end

  erb :index
end