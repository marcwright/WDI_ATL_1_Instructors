require 'sinatra'
require 'sinatra/reloader'

comp_array = [
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"
]

colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]

get '/' do 
  @compliments = comp_array.sample
  @color = colors.sample
  erb :compliment
end

get '/:name' do
  @compliments = comp_array.sample
  @color = colors.sample
  @name = params[:name]
  erb :compliment
end

post '/add' do
 comp_array.push(params[:new_comp])
end

# post '/calculator/addition' do
#   add_num = params[:num1].to_i + params[:num2].to_i
#   counter = calc_hash.keys.count + 1
#   counter += 1
#   calc_hash[counter] = add_num
#   "#{calc_hash[counter]} = #{params[:num1]} + #{params[:num2]}"
# end
