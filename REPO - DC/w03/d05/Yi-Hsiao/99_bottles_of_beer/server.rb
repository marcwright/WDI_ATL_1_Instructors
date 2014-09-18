require "sinatra"
require "sinatra/reloader"
require "slim"

get "/" do
  slim :index
end

get "/verse/:bottles" do |bottles|
  @num_bottles = bottles.to_i
  slim :verse
end

get "/refrain/:bottles" do |bottles|
  @starting_bottles = bottles.to_i
  @plural_bottles = @starting_bottles > 1
  @bottles_left = bottles.to_i - 1
  slim :refrain
end
