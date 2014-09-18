require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'
require 'json'
require 'pry'

portfolio = {}

get '/' do
  erb :index
end

post '/' do
  redirect to('/' + params['symbol'])
end

post '/trade' do
  if params[:type] and params[:amount] and params[:symbol]
    if params[:type] == 'buy'
      portfolio[params[:symbol]] = params[:amount]
    elsif params[:type] == 'sell'
      if portfolio.has_key? params[:symbol] and portfolio[params[:symbol]] >= params[:amount]
        portfolio[params[:symbol]] -= params[:amount]
      end
    end
    [200, {"Content-Type" => "application/json"}, JSON.generate(portfolio)]
  end
end

get '/:symbol' do
  quote = YahooFinance::get_standard_quotes(params[:symbol])[params[:symbol]]
  @vals = {:updatedAt => DateTime.now}
  [:symbol, :name, :date, :time, :lastTrade].each { |s| @vals[s] = quote.send s }

  if request.xhr?
    [200, {"Content-Type" => "application/json"}, JSON.generate(@vals)]
  else
    erb :quote
  end
end
