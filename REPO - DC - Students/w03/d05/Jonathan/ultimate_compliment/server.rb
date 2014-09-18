require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/:new_name' do
  erb :compliment
end

post '/' do
  name_ref = names.keys.last
  names[name_ref] = params[:new_name]
end


# get '/:new_name' do
#   new_compliment = 1 + rand(4)
#   "#{params[:new_name]}, "
#   compliments[new_compliment]
# end

# binding.pry
