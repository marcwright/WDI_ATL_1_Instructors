require 'sinatra'
require 'sinatra/reloader'
require 'pry'

past_calcs = {
  1 => "2 + 2 = 4",
}

get '/' do
  "Welcome to the calculator"
end

get '/calculator' do
  past_calcs.to_s
end

#the calc number comes in as a parameter, and it is used as a key to access the value from past_calcs hash
get '/calculator/:past_calc' do
  calc_num = params[:past_calc].to_i
  past_calcs[calc_num].to_s
end

post '/calculator/add' do
  sum = params[:num1].to_i + params[:num2].to_i
  new_key = past_calcs.keys.last + 1
  past_calcs[new_key] = "#{params[:num1]} + #{params[:num2]} = #{sum}"
end

post '/calculator/subtract' do
  difference = params[:num1].to_i - params[:num2].to_i
  new_key = past_calcs.keys.last + 1
  past_calcs[new_key] = "#{params[:num1]} - #{params[:num2]} = #{difference}"
end

post '/calculator/multiply' do
  product = params[:num1].to_i * params[:num2].to_i
  new_key = past_calcs.keys.last + 1
  past_calcs[new_key] = "#{params[:num1]} * #{params[:num2]} = #{product}"
end

post '/calculator/divide' do
  quotient = params[:num1].to_i / params[:num2].to_i
  new_key = past_calcs.keys.last + 1
  past_calcs[new_key] = "#{params[:num1]} / #{params[:num2]} = #{quotient}"
end
