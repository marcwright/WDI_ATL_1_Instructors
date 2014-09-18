require 'sinatra'
require 'sinatra/reloader'

# store previous calculations in array
calculations = []

get '/' do
  return "Welcome to the calculator!"
end

get '/calculator' do
  return "No calculations yet!" if calculations.count == 0
  return calculations.join(", ")
end

get '/calculator/:calc_id' do
  return "Calculation doesn't exist!" if calculations.at(params[:calc_id].to_i - 1 ) == nil
  return calculations.join(", ")
end

post '/calculator/add/' do
  add_answer = (params[:first_number].to_i + params[:second_number].to_i).to_s
  calculations.push({id: params[:id], first_number: params[:first_number], second_number: params[:second_number], operation: "+"})
  return params[:first_number].to_s + " + " + params[:second_number].to_s + " = " + add_answer.to_s
end

post '/calculator/subtract/' do
  subtract_calc = (params[:first_number].to_i - params[:second_number].to_i).to_s
  calculations.push({id: params[:id], first_number: params[:first_number], second_number: params[:second_number], operation: "+"})
  return params[:first_number].to_s + " - " + params[:second_number].to_s + " = " + sbutract_answer.to_s
end

post '/calculator/multiply/' do
  multiply_calc = (params[:first_number].to_i * params[:second_number].to_i).to_s
  calculations.push({id: params[:id], first_number: params[:first_number], second_number: params[:second_number], operation: "+"})
  return params[:first_number].to_s + " * " + params[:second_number].to_s + " = " + multiply_calc.to_s
end

post '/calculator/divide/' do
  divide_calc = (params[:first_number].to_i / params[:second_number].to_i).to_s
  calculations.push({id: params[:id], first_number: params[:first_number], second_number: params[:second_number], operation: "+"})
  return params[:first_number].to_s + " / " + params[:second_number].to_s + " = " + divide_calc.to_s
end
