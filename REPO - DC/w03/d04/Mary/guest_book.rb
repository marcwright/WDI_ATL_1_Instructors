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
  guest_book[params[:id].to_i]
end

# if post request is made to this website, we will use that to execute following code; id was used as key in Postman key-value pair along with value "scottman caruthers"
post '/guest_book' do
  new_key = guest_book.keys.last + 1
  guest_book[new_key] = params[:id]

end
