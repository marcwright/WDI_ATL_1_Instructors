require 'sinatra'
require 'sinatra/reloader'
require 'pry'



get '/' do
   erb :form
end

post '/pony' do
   binding.pry
   "Pony accepted"
end

post '/flight' do
   binding.pry
   "Flight accepted"
end


post '/login' do
   binding.pry
   "Login complete!"
end


post '/pizza' do
   binding.pry
   "Pizza is being dispatched!"
end
