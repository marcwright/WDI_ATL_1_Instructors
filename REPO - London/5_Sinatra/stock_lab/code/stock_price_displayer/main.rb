require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all'
require 'yahoofinance'

get '/' do
  if params[:symbol]
    @symbol = params[:symbol].upcase
    @quote = YahooFinance.get_standard_quotes(@symbol)[@symbol]
  end

  erb :quote
end








