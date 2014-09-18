require 'sinatra'
require 'sinatra/reloader'
require 'pry'

guest_book = {
  1 => "Jack Nicholson",
  2 => "Shelly Duvall",
  3 => "Danny Lloyd"
}

get '/guest_book' do
  guest_book.values.join(", ")
end

get '/guest_book/:id' do
  id = params[:id].to_i
  guest_book[id]
end

post '/guest_book' do
  new_key = guest_book.keys.last + 1
  guest_book[new_key] = params[:id]
end

