require 'pry'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'


get '/' do
 response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?"apikey=[fe4c4773e2814ccab0ce47b77bc8c92b])
 response_hash = JSON(response)
end
