# https://gist.github.com/Pavling/0eee762c1cca766b247c

require 'pry-byebug'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

get '/' do
  redirect to('/items')
end

get '/items' do
  # sql = "select * from items"
  erb :index
end

get '/items/new' do
  erb :new
end

post '/items' do
  # "insert into items...."
  redirect to('/items') # or can you get the id of the record created by the insert, and redirect to that?
end

get '/items/:id' do
  erb :show
end

get '/items/:id/edit' do
  erb :edit
end

post '/items/:id' do
  redirect to("/items/#{params[:id]}")
end

post '/items/:id/delete' do
  redirect to('/')
end