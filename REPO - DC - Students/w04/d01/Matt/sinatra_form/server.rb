require "sinatra"
require "sinatra/reloader"
require "pry"

get "/" do
  erb :form
end

get "/pizza" do
  binding.pry
end

post "/pizza" do
  "Hey dawg"
end

# Dog.create({name: "Poo", toy: "Bone"})
