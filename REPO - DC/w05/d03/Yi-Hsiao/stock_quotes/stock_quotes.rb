require "sinatra"
require "httparty"
require "pry"

get "/" do
  if params[:symbol]
    request_url = "http://dev.markitondemand.com/Api/Quote/json?symbol=" + params[:symbol]
    response = JSON(HTTParty.get request_url)

    if response["Data"] && response["Data"]["Status"] == "SUCCESS"
      stock_data = response["Data"]

      @stock = {
        :"Company"            => stock_data["Name"],
        :"Last Price"         => stock_data["LastPrice"],
        :"High Price"         => stock_data["High"],
        :"Low Price"          => stock_data["Low"],
        :"Outstanding Shares" => stock_data["MarketCap"] / stock_data["LastPrice"]
      }
    end
  end

  erb :index
end
