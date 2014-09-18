require 'pg'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection(:adapter => "postgresql",
  :host => "localhost",
  :username => "postgres",
  :password => " ",
  :database => "calculator_db")

class Calculation < ActiveRecord::Base

end

# calculations = {}

get '/' do
  "Welcome to the Calculator!"
end

get '/calculator' do
  # calculations.values.join("<br /> ")
  Calculation.all.select(:calculation)
end

get '/calculator/:id' do
  # id = params[:id].to_i
  # if calculations.has_key?(id)
  #   calculations[id]
  # else
  #   "That id was not found!"
  # end
  Calculation.find_by(id: id).select(:calculation)
end

post '/calculator/add' do
  # if calculations.empty?
  #   new_key = 1
  # else
  # new_key = calculations.keys.last + 1
  # end
  # calculations[new_key] = "#{params[:num1].to_i} + #{params[:num2].to_i} = #{params[:num1].to_i + params[:num2].to_i}"

  # "#{params[:num1].to_i + params[:num2].to_i}"
  Calculation.create(calculation: "#{params[:num1].to_i} + #{params[:num2].to_i} = #{params[:num1].to_i + params[:num2].to_i}")
end

post '/calculator/subtract' do
  # if calculations.empty?
  #   new_key = 1
  # else
  # new_key = calculations.keys.last + 1
  # end
  # calculations[new_key] = "#{params[:num1].to_i} - #{params[:num2].to_i} = #{params[:num1].to_i - params[:num2].to_i}"

  # "#{params[:num1].to_i - params[:num2].to_i}"

  Calculation.create(calculation: "#{params[:num1].to_i} - #{params[:num2].to_i} = #{params[:num1].to_i - params[:num2].to_i}")

end

post '/calculator/multiply' do
  # if calculations.empty?
  #   new_key = 1
  # else
  # new_key = calculations.keys.last + 1
  # end
  # calculations[new_key] = "#{params[:num1].to_i} * #{params[:num2].to_i} = #{params[:num1].to_i * params[:num2].to_i}"

  # "#{params[:num1].to_i * params[:num2].to_i}"
  Calculation.create(calculation: "#{params[:num1].to_i} * #{params[:num2].to_i} = #{params[:num1].to_i * params[:num2].to_i}")
end

post '/calculator/divide' do
  # if calculations.empty?
  #   new_key = 1
  # else
  # new_key = calculations.keys.last + 1
  # end
  # calculations[new_key] = "#{params[:num1].to_i} / #{params[:num2].to_i} = #{params[:num1].to_i / params[:num2].to_i}"

  # "#{params[:num1].to_i / params[:num2].to_i}"

  Calculation.create(calculation: "#{params[:num1].to_i} / #{params[:num2].to_i} = #{params[:num1].to_i / params[:num2].to_i}")
end
