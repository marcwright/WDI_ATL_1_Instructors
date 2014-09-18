require 'sinatra'
require 'sinatra/reloader'

past_calculations = {}

get '/' do
  welcome = "Welcome to the calculator, let's do some calculations!"
  "<h1>#{welcome}</h1>"
end

get '/calculator' do
  past_calculations.values.join("<br />")
end

get '/calculator/:id' do
  id = params[:id].to_i
  past_calculations[id].to_s
end

post '/calculator/add' do
  sum = params[:num1].to_i + params[:num2].to_i
  if past_calculations.empty?
    new_key = 1
    past_calculations[new_key] = "#{params[:num1]} + #{params[:num2]} = #{sum}"
  else
    new_key = past_calculations.keys.last + 1
    past_calculations[new_key] = "#{params[:num1]} + #{params[:num2]} = #{sum}"
  end
end

post '/calculator/subtract' do
  difference = params[:num1].to_i - params[:num2].to_i
  if past_calculations.empty?
    new_key = 1
    past_calculations[new_key] = "#{params[:num1]} + #{params[:num2]} = #{sum}"
  else
    new_key = past_calculations.keys.last + 1
    past_calculations[new_key] = "#{params[:num1]} - #{params[:num2]} = #{difference}"
  end
end

post '/calculator/multiply' do
  product = params[:num1].to_i * params[:num2].to_i
  if past_calculations.empty?
    new_key = 1
    past_calculations[new_key] = "#{params[:num1]} + #{params[:num2]} = #{sum}"
  else
    new_key = past_calculations.keys.last + 1
    past_calculations[new_key] = "#{params[:num1]} * #{params[:num2]} = #{product}"
  end
end

post '/calculator/divide' do
  quotient = params[:num1].to_i / params[:num2].to_i
  if past_calculations.empty?
    new_key = 1
    past_calculations[new_key] = "#{params[:num1]} + #{params[:num2]} = #{sum}"
  else
    new_key = past_calculations.keys.last + 1
    past_calculations[new_key] = "#{params[:num1]} / #{params[:num2]} = #{quotient}"
  end
end


