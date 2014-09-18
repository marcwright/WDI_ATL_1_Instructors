require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require 'pg'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "richwardell",
  :password => "",
  :database => "calculator"
)
class Calculation < ActiveRecord::Base
end

# welcome screen for calculator
get '/calculator' do
  "<h1> WELCOME TO MY CALCUL-MA-LATOR!!!!</h1>" +
  "<h2> The Calculations you've done so far are: <h2>" +
  Calculation.pluck(:calculation).join("<br >")
end

# allows users to search past calculations by index
get '/calculator/:id' do
  id = params[:id].to_i
  "<h1>Calculation ##{id} was: </h1>" +
  "#{Calculation.where(id: id).pluck(:calculation).join("<br >")}"
end

# captures addition input from user and saves to databas
post '/calculator/add' do
  results = params[:num1].to_i + params[:num2].to_i
  Calculation.create(calculation: "#{params[:num1]} added to #{params[:num2]} equals #{results}")
  "#{params[:num1]} added to #{params[:num2]} equals #{results}"
end

# captures subtraction input from user and saves to databas
post '/calculator/subtract' do
  results = params[:num1].to_i - params[:num2].to_i
  Calculation.create(calculation:"#{params[:num1]} subtracted from #{params[:num2]} equals #{results}")
  "#{params[:num1]} subtracted from #{params[:num2]} equals #{results}"
end

# captures multiplication input from user and saves to databas
post '/calculator/multiply' do
  results = params[:num1].to_i * params[:num2].to_i
  Calculation.create(calculation: "#{params[:num1]} multiplied by #{params[:num2]} equals #{results}")
  "#{params[:num1]} multiplied by #{params[:num2]} equals #{results}"
end

# captures division input from user and saves to databas
post '/calculator/divide' do
  results = params[:num1].to_f / params[:num2].to_f
  Calculation.create(calculation: "#{params[:num1]} divided by #{params[:num2]} equals #{results}")
  "#{params[:num1]} divided by #{params[:num2]} equals #{results}"
end
