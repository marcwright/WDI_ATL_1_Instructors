require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  erb :form
end

get '/ponies' do
  Pry.config.input = STDIN
  Pry.config.output = STDOUT
  binding.pry
end

post '/ponies' do
  Pry.config.input = STDIN
  Pry.config.output = STDOUT
  binding.pry
end

post '/booking' do
  Pry.config.input = STDIN
  Pry.config.output = STDOUT
  binding.pry
end


post '/logins' do
  Pry.config.input = STDIN
  Pry.config.output = STDOUT
  binding.pry
end

post '/pizza_delivery' do
  Pry.config.input = STDIN
  Pry.config.output = STDOUT
  binding.pry
end