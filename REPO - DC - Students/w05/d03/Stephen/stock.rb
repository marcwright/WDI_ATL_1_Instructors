#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-21 11:35:27
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-21 12:27:39

require 'pry'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  if params[:symbol]
    response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{params[:symbol]}")

    response_json = JSON(response)
    if response_json["Data"] && response_json["Data"]["Status"] == "SUCCESS"
      data = response_json["Data"]
      @price = data["LastPrice"]
      @high = data["High"]
      @low = data["Low"]
      @num = data["MarketCap"] / @price.to_i
    else
      @error = response_json["Message"]
    end
  end

  erb :index
end
