require 'sinatra'
require 'sinatra/reloader'
require 'pry'

guests = {
  1 => "Jack Nicholson",
  2 => "Shelly Duvall",
  3 => "Danny Lloyd"
}

get '/guest_book' do
  guests.values.join(", ")
end

get '/guest_book/:id' do
  id = params[:id].to_i
  guests[id]
end

post '/guest_book' do
  new_key = guests.keys.last + 1
  guests[new_key] = params[:id]
end
