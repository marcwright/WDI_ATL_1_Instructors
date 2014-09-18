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
  "hello ponies!"
end

get '/flight_booker' do
  erb :flight_booker
end

post '/flight_booker' do
  "flight is booked!"
end

get '/pizza_order' do
  erb :pizza_order
end

post '/pizza_order' do
  "your pizza is ordered!"
end

get '/website_login' do
  erb :website_login
end

post '/login' do
  "your login is created!!"
end





