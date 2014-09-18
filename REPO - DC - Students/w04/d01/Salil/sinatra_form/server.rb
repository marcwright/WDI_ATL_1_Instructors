require 'sinatra'
require 'sinatra/reloader'
require 'pry'


get '/' do
  erb :form
end

get '/ponies' do
  # binding.pry
end

post '/ponies' do
  "hello ponies"
end

get '/flights' do
end

post '/flights' do
  "Your flight has been recorded"
end

get '/pizzas' do

end

post '/pizzas' do
  "Your pizza order has been recorded"
end
