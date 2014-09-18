require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/'  do
  erb :form
end

get '/ponies' do
  binding.pry
end

post '/ponies' do
  binding.pry
end
