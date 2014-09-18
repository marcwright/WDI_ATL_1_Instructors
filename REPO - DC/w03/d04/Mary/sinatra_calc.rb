require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# past calculations stored in array of phrases
past_calculations = []

get '/' do
  "Welcome to the Sinatra Calculator!"
end

get '/calculator' do

  "Past Calculations: " + past_calculations.join(", ")
end

get '/calculator/:id' do
  if past_calculations[params[:id].to_i] == nil
    "ID wasn't found"
  else
    past_calculations[params[:id].to_i]
  end
end

post '/calculator/add' do
  addition_calc = (params[:first_number].to_i + params[:second_number].to_i).to_s
  past_calculations.push({id: params[:id], first_number: params[:first_number], second_number: params[:second_number], operation: "+"})
  return params[:first_number].to_s + " + " + params[:second_number].to_s + " = " + addition_calc.to_s
end

post '/calculator/subtract' do
  subtraction_calc = (params[:first_number].to_i - params[:second_number].to_i).to_s
  past_calculations.push({id: params[:id], first_number: params[:first_number], second_number: params[:second_number], operation: "-"})
  return params[:first_number].to_s + " - " + params[:second_number].to_s + " = " + subtraction_calc
end

post '/calculator/multiply' do
  multiplication_calc = (params[:first_number].to_i * params[:second_number].to_i).to_s
  past_calculations.push({id: params[:id], first_number: params[:first_number], second_number: params[:second_number], operation: "*" })
  return params[:first_number].to_s + " * " + params[:second_number].to_s + " = " + multiplication_calc
end

post '/calculator/divide' do
  division_calc = (params[:first_number].to_i / params[:second_number].to_i).to_s
  past_calculations.push({id: params[:id], first_number: params[:first_number], second_number: params[:second_number], operation: "/"})
  return params[:first_number].to_s + " / " + params[:second_number].to_s + " = " + division_calc
end

