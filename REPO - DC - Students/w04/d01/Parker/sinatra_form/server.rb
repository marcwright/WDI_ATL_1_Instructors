require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
	erb :forms	
end

get '/ponies' do
	binding.pry
end

post '/ponies' do
	"hello ponies!"
end

post '/flight' do
	"Information Accepted"
end

post '/login' do
	"Login Form"
end

post '/pizza' do
	"Pizza Order"	
end


