require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# http://localhost:4567/

# Write your ruby file with a '/' method
# Run ruby file
# Access ruby file via browser


# Sinatra must return string in order for Chrome to render data

calc_hash = {}

get '/' do
  "Welcome to the Sinatra Calculator!"
end

post '/calculator/addition' do
  add_num = params[:num1].to_i + params[:num2].to_i
  counter = calc_hash.keys.count + 1
  counter += 1
  calc_hash[counter] = add_num
  "#{calc_hash[counter]} = #{params[:num1]} + #{params[:num2]}"
end

post '/calculator/subtraction' do
  add_num = params[:num1].to_i - params[:num2].to_i
  counter = calc_hash.keys.count + 1
  counter += 1
  calc_hash[counter] = add_num
  "#{calc_hash[counter]} = #{params[:num1]} - #{params[:num2]}"
end

post '/calculator/multiplication' do
  add_num = params[:num1].to_i * params[:num2].to_i
  counter = calc_hash.keys.count + 1
  counter += 1
  calc_hash[counter] = add_num
  "#{calc_hash[counter]} = #{params[:num1]} - #{params[:num2]}"
end

post '/calculator/division' do
  add_num = params[:num1].to_i / params[:num2].to_i
  counter = calc_hash.keys.count + 1
  counter += 1
  calc_hash[counter] = add_num
  "#{calc_hash[counter]} = #{params[:num1]} - #{params[:num2]}"
end

get '/calculator/answer' do
  "#{calc_hash.values}"  
end

# path needs to have a placeholder for keys
get '/calculator/:key' do
  # if calc_hash.has_key?(params[:key].to_i)
  input = params[:id].to_i
  "#{calc_hash.values_at(:key).to_i}"
  #   "test true"
  # else
  #   "test false"
  # end
end
get '/guest_book/:id' do
  id = params[:id].to_i
  guest_book[id]
end
