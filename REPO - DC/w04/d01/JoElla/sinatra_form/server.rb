require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  erb :form
end

get '/ponies' do
  binding.pry
end

post '/ponies' do
  binding.pry
end

post '/flight_finder' do
  binding.pry
  erb :form
end

post '/login' do
  Pry.config.input = STDIN
  Pry.config.output = STDOUT
  erb :form
end

post '/pizza' do
  erb :form
end
