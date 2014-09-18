require 'sinatra'
require 'sinatra/reloader'
require 'pry'

names = {
  1 => "Jonathan"
}

get '/' do
  names.values.join(", ")
end

get '/:new_name' do
  new_name = params[:new_name].to_i
  names[new_name]
end

post '/' do
  name_ref = names.keys.last
  names[name_ref] = params[:new_name]
end
