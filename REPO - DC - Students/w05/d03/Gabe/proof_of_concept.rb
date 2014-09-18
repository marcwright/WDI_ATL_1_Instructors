# NY Times API (key required)
# Wikipedia Article API



require 'pry'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'

get '/' do

  if !params[:query].nil?
  @query = params[:query]
  response = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&titles=#{@query}&prop=revisions&rvprop=content
")
  response_hash = JSON(response)
  @page = response_hash["query"]["pages"]
  binding.pry

end

 #if !params[:symbol].nil?
 # @stock_symbol = params[:query]
 # response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{@stock_symbol}")
 # response_hash = JSON(response)
#
#
#
 # if response_hash["Data"] && response_hash["Data"]["Status"] == "SUCCESS"
 #   @last_price = response_hash["Data"]["LastPrice"]
 #   @company_name = response_hash["Data"]["Name"]
 #   @high = response_hash["Data"]["High"]
 #   @low = response_hash["Data"]["Low"]
 #   @cap = response_hash["Data"]["MarketCap"]
 #   @num_shares = @cap/@last_price
 # else
 #   @error = response_hash["Message"]
#
 # end
#
 #end







 erb :index

end

