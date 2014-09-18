require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  erb :form
end

get '/ponies' do
end

post '/ponies' do
  binding.pry
end

get '/flights' do
  binding.pry
end

post '/flights' do
  binding.pry
end

get '/logins' do
  binding.pry
end

post '/logins' do
  binding.pry
end

get '/pizzas' do
  binding.pry
end

post '/pizzas' do
  binding.pry
end
