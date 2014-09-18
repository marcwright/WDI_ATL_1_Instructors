
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def add (num1, num2)
    return "#{(num1.to_i)} + #{(num2.to_i)} = #{(num1.to_i) + (num2.to_i)}"
end

def subt (num1, num2)
    return "#{(num1.to_i)} - #{(num2.to_i)} = #{(num1.to_i) - (num2.to_i)}"
end

def mult (num1, num2)
    return "#{(num1.to_i)} * #{(num2.to_i)} = #{(num1.to_i) * (num2.to_i)}"
end

def div (num1, num2)
    return "#{(num1.to_i)} / #{(num2.to_i)} = #{(num1.to_i) / (num2.to_i)}"
end

calculations = {}

get '/' do
  "Welcome to the Sinatra Calculator!"
end

post '/calculator/add'  do
  add(params[:num1], params[:num2])
  if calculations.keys == []
    new_key = 1
  else
    new_key = calculations.keys.last + 1
  end
  calculations[new_key] = "#{params[:num1].to_i} + #{params[:num2].to_i} = #{(params[:num1].to_i) + (params[:num2].to_i)}"
end

post '/calculator/subtract'  do
  subt(params[:num1], params[:num2])
  if calculations.keys == []
    new_key = 1
  else
    new_key = calculations.keys.last + 1
  end
  calculations[new_key] = "#{params[:num1].to_i} - #{params[:num2].to_i} = #{(params[:num1].to_i) - (params[:num2].to_i)}"
end

post '/calculator/multiply'  do
  mult(params[:num1], params[:num2])
  if calculations.keys == []
    new_key = 1
  else
    new_key = calculations.keys.last + 1
  end
  calculations[new_key] = "#{params[:num1].to_i} * #{params[:num2].to_i} = #{(params[:num1].to_i) * (params[:num2].to_i)}"
end

post '/calculator/divide'  do
  div(params[:num1], params[:num2])
  if calculations.keys == []
    new_key = 1
  else
    new_key = calculations.keys.last + 1
  end
  calculations[new_key] = "#{params[:num1].to_i} / #{params[:num2].to_i} = #{(params[:num1].to_i) / (params[:num2].to_i)}"
end

get '/calculator/:id' do
  id = params[:id].to_i
  # binding.pry
  if calculations[id] == nil
    return "That is not a valid ID"
  else
    return calculations[id]
  end
end

get '/calculator' do
  hello = ""

  while count <= calculations.length
    count += 1
    binding.pry

    hello = hello + calculations.values_at(count) + "\n"
  end
end

