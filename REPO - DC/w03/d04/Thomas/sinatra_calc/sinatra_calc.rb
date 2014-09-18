require 'sinatra'
require 'sinatra/reloader'
require 'pry'

calculations = {
  1 => "1 + 1 = 2"
}

get '/' do
  "<h1>Welcome to the Calculator</h1>"
end

get '/calculator' do
  calculations.values.join(",  ")
end

get '/calculator/:id' do
  id = params[:id].to_i
  calculations[id]
end

post '/calculator/add' do
  operation_add = "#{params[:num1]} + #{params[:num2]} = #{params[:num1].to_i + params[:num2].to_i}"
  new_key = calculations.keys.last + 1
  calculations[new_key] = operation_add.to_s
  operation_add
end

post '/calculator/subtract' do
  operation_sub = "#{params[:num1]} - #{params[:num2]} = #{params[:num1].to_i + params[:num2].to_i}"
  new_key = calculations.keys.last + 1
  calculations[new_key] = operation_sub.to_s
  operation_sub
end

post '/calculator/multiply' do
  operation_mult = "#{params[:num1]} * #{params[:num2]} = #{params[:num1].to_i * params[:num2].to_i}"
  new_key = calculations.keys.last + 1
  calculations[new_key] = operation_mult.to_s
  operation_mult
end

post '/calculator/divide' do
  operation_div = "#{params[:num1]} / #{params[:num2]} = #{params[:num1].to_f / params[:num2].to_f}"
  new_key = calculations.keys.last + 1
  calculations[new_key] = operation_div.to_s
  operation_div
end


