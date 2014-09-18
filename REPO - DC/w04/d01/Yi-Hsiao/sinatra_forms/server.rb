require "sinatra"
require "slim"
require "pry"

get "/" do
  slim :form
end

get "/ponies" do
end

["/add-ponies", "/book-flights", "/login", "/order-pizzas"].each do |path|
  post path do
    binding.pry
  end
end
