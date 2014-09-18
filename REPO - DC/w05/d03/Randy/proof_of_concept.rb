require 'pry'
require 'httparty' #Allows us to make HTTP requests
require 'sinatra'
require 'sinatra/reloader'

  get '/' do
    if params[:name]
      game_name = params[:name].gsub(" ", "+")
      response = HTTParty.get("http://www.giantbomb.com/api/search/?api_key=57c31f1066c13eaeaca445283b41bf9c39b9b753&format=json&query=#{game_name}&resources=game&limit=5")
      binding.pry
    end
  erb :index
  end


