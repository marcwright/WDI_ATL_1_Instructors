require "sinatra"
require "sinatra/reloader"
require "pry"

guest_book = {
  1 => "Jack Nicholson",
  2 => "Shelly Duvall",
  3 => "Danny Lloyd"
}

# view all guests in the guest book
get "/guest_book" do
  guest_book.values.join(", ")
end

# view a particular guest in the guest book
get "/guest_book/:id" do |id|
  guest_book[id.to_i]
end

# add a new guest in the guest book
post "/guest_book" do
  new_id = guest_book.size + 1
  guest_book[new_id] = params[:name]
end
