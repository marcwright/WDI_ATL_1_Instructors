# Stephen Stanwood (stephen@stanwoodsolutions.com)

require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

# DROP TABLE IF EXISTS equations;
# CREATE TABLE equations (
#   id SERIAL PRIMARY KEY,
#   num1 INTEGER NOT NULL,
#   num2 INTEGER NOT NULL,
#   operator VARCHAR(100) NOT NULL,
#   result INTEGER NOT NULL
# );

class Equation < ActiveRecord::Base
  def to_s
    return "#{num1} #{operator} #{num2} = #{result}"
  end
end

# Logger will print out the actual SQL that runs to the Terminal
# ActiveRecord::Base.logger = Logger.new(STDOUT)

# Connect to our postgres database for equations
$connection = ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "stephenstanwood",
  :password => "",
  :database => "equations_db")

def store_equation(n1, n2, op)
  return Equation.create(num1: n1, num2: n2, operator: op,
      result: eval("#{n1} #{op} #{n2}")).to_s
end

get '/' do
  return "Welcome to the calculator!"
end

get '/calculator' do
  return "No equations yet!" if Equation.count == 0
  return Equation.all.map { |e| e.to_s }.join("<br />")
end

post '/calculator/add' do
  return store_equation(params[:num1], params[:num2], "+")
end

post '/calculator/subtract' do
  return store_equation(params[:num1], params[:num2], "-")
end

post '/calculator/multiply' do
  return store_equation(params[:num1], params[:num2], "*")
end

post '/calculator/divide' do
  return store_equation(params[:num1], params[:num2], "/")
end

get '/calculator/:num' do
  n = params[:num].to_i
  return "There is no record ##{n}!" if !Equation.exists?(n)
  return Equation.find(n).to_s
end

$connection.disconnect!
