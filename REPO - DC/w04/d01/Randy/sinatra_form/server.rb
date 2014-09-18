require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  erb :forms
end

post '/ponies' do
  "Hi #{params[:pony_name]}"
end

post '/flight' do
  "Your flight from #{params[:origin]} to #{params[:destination]} on #{params[:date]} is confirmed"
end

post '/login' do
  "You're email: #{params[:email]} and password: #{params[:pass]}"
end

post '/pizza' do
  "That's one #{params[:size]} with #{params[:top1]}, #{params[:top2]} & #{params[:top3]}"
end

