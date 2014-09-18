require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  erb :form
end

get '/people' do
  binding.pry
end

post '/people' do
  binding.pry
end