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

post '/flight_sight' do

end

post '/login' do

end

post '/pizza_delivery' do

end
# Flight Booking
# Website Login
# Pizza Delivery
