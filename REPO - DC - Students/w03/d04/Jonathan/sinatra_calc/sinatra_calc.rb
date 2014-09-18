require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# When they visit the homepage (GET) (/), a user should see some text to welcome them to the calculator

get '/' do
  return "Welcome to the Calculator"
end





# When they visit the /calculator page (GET), a user should be able to see all of the calculations that have been done in the past

results = {
  1 => "10",
  2 => "8",
  3 => "7"
}

# A user can POST an Addition calculation to /calculator/add by providing 2 numbers as parameters. Use the POSTman Chrome extension to try out your POST

post '/calculator/add' do
  results.keys.last + 1
  value_1 = params[:num_1].to_i
  value_2 = params[:num_2].to_i
  add_sum = value_1 + value_2
  newkey = results.keys.last + 1
  results[newkey] = add_sum.to_s

end

post '/calculator/subtract' do
  results.keys.last + 1
  value_1 = params[:num_1].to_i
  value_2 = params[:num_2].to_i
  sum = value_1 - value_2
  newkey = results.keys.last + 1
  results[newkey] = sum.to_s

end

post '/calculator/multiply' do
  results.keys.last + 1
  value_1 = params[:num_1].to_i
  value_2 = params[:num_2].to_i
  sum = value_1 * value_2
  newkey = results.keys.last + 1
  results[newkey] = sum.to_s

end

post '/calculator/divide' do
  results.keys.last + 1
  value_1 = params[:num_1].to_i
  value_2 = params[:num_2].to_i
  sum = value_1 / value_2
  newkey = results.keys.last + 1
  results[newkey] = sum.to_s

end

get '/calculator/:id' do
  id = params[:id].to_i
  return results[id]
end





# A user can see a the third calculation they've done in the past by visiting /calculator/3 (GET). Same with any other number. If the calculation doesn't exist, they should see text saying that the id wasn't found.
