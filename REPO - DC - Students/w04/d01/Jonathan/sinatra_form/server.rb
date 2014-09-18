require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# get '/' do
#   erb :form
# end

# get '/ponies' do
#   binding.pry
# end

# post '/ponies' do
#   binding.pry
# end

# Pizza Delivery
get '/' do
  erb :form
end

get '/pizza_delivery' do
end

post '/pizza_delivery' do
end


# Flight Booking
get '/' do
  erb :form
end

get '/flight_booking' do
binding.pry
end

post '/flight_booking' do
binding.pry
end


# Website Login

