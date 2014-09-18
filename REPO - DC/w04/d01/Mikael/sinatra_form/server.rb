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

#Flight Booking
post '/flight' do
  binding.pry
end

#Website Login
post '/login' do
  binding.pry
end

#Pizza Delivery
post '/pizza' do
end
