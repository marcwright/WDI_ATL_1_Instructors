require 'sinatra'
require 'sinatra/reloader'

get '/' do
	hart = "parker laurren hart"
	"<h1>r#{hart}</h1>"
end

# get '/greetings/:name/:fav_food' do
# 	if params[:name] == "mary"
# 		"Hey #{params[:name]}, heard it's your birthday. Want some #{params[:fav_food]}?"
# else
# 	  	"What up, #{params[:name]}, lets eat some #{params[:fav_food]}"
# end


# class AllButPattern
#   Match = Struct.new(:captures)

#   def initialize(except)
#     @except   = except
#     @captures = Match.new([])
#   end

#   def match(str)
#     @captures unless @except === str
#   end
# end

# def all_but(pattern)
#   AllButPattern.new(pattern)
# end

# get all_but("/index") do
#   # ...
# end

# set(:probability) { |value| condition { rand <= value } }

# get '/win_a_car', :probability => 0.1 do
#   "You won!"
# end

# get '/win_a_car' do
#   "Sorry, you lost."
# end

# get '/foo', :agent => /Songbird (\d\.\d)[\d\/]*?/ do
#   "You're using Songbird version #{params[:agent][0]}"
# end

# get '/foo' do
#   # Matches non-songbird browsers
# end

# get %r{/hello/([\w]+)} do
#   "Hello, #{params[:captures].first}!"
# end	