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

# Flight Booking
get '/find_flight' do
  binding.pry
end

post '/find_flight' do
  binding.pry
end

# Website login
get '/login' do
end

post '/login' do
end
# Pizza Delivery
get '/order_pizza' do
end

post '/order_pizza' do
end
