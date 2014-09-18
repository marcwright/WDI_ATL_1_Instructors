require 'sinatra'
require 'sinatra/reloader'


ruby_compliments = [
   "Your instructors love you",
   "High five = ^5",
   "Is it Ruby Tuesday yet?",
   "It's almost beer o'clock",
   "The Force is strong with you" ]

   colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]


get '/' do

   num_comps = ruby_compliments.count
   rand_no = rand(num_comps)
   @compliment = ruby_compliments[rand_no]

   rand_color = rand(4)
   @rand_bg_color = colors[rand_color]

   erb :compliment
end

get '/:username' do
   @username = params[:username]

   num_comps = ruby_compliments.count
   rand_no = rand(num_comps)
   @compliment = ruby_compliments[rand_no]

   rand_color = rand(4)
   @rand_bg_color = colors[rand_color]

   erb :compliment
end

#== to post compliments to the program, navigate to /add
#== and use key newcomp to add compliments. See below;

post '/add' do

  to_add = params[:newcomp]
  newindex = ruby_compliments.count
  ruby_compliments[newindex] = to_add
  "#{to_add}"

 end




# get '/' do
# erb :index
# end
#
# get '/verse/:bottles' do
#  @bottles = params[:bottles].to_i
#
#   if @bottles >= 0
#
#    @plural = @bottles > 1
#    erb :verse
#
#   else
#     redirect "/"
#
#   end
# end
#
# get '/refrain/:bottles' do
#  @bottles = params[:bottles].to_i
#  @next = @bottles - 1
#
#  erb :refrain
# end
