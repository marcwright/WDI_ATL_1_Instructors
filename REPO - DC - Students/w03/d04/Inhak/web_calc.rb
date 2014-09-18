require 'sinatra'
require 'sinatra/reloader'

expressions = []
last_calcs = {
  1 => "1 + 1 = 2",
  2 => "2 + 2 = 4",
  3 => "3 * 3 = 9",
  4 => "4 - 2 = 2"
}

get '/' do
  return "Welcome to the Calculator!"
end

get '/calculator/' do
  last_calcs.values.join(", ")
end

get '/calculator/:id' do
  id = params[:id].to_i
  last_calcs[id]
end

post '/calculator/add' do
  first_value = params[:id]
  second_value = params[:id2]
  last_key = last_calcs.keys.last + 1
  last_calcs[last_key] =("#{first_value} + #{second_value} = #{first_value.to_i + second_value.to_i}")
  return "#{first_value} + #{second_value} = #{first_value.to_i + second_value.to_i}"

end

post '/calculator/subtract' do
  first_value = params[:id]
  second_value = params[:id2]
  last_key = last_calcs.keys.last + 1
  last_calcs[last_key] =("#{first_value} - #{second_value} = #{first_value.to_i - second_value.to_i}")
  return "#{first_value} - #{second_value} = #{first_value.to_i - second_value.to_i}"
end

post '/calculator/multiply' do
  first_value = params[:id]
  second_value = params[:id2]
  last_key = last_calcs.keys.last + 1
  last_calcs[last_key] =("#{first_value} * #{second_value} = #{first_value.to_i * second_value.to_i}")
  return "#{first_value} * #{second_value} = #{first_value.to_i * second_value.to_i}"

end

post '/calculator/divide' do
  first_value = params[:id]
  second_value = params[:id2]
  last_key = last_calcs.keys.last + 1
  last_calcs[last_key] =("#{first_value} / #{second_value} = #{first_value.to_f / second_value.to_f}")
  return "#{first_value} / #{second_value} = #{first_value.to_f / second_value.to_f}"

end
