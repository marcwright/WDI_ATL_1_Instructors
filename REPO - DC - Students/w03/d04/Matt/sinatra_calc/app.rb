require "sinatra"
require "sinatra/reloader"
require "pry"

calculate = {
  :add => [],
  :sub => [],
  :times => [],
  :divide => []
}

get '/' do
  '<h1>Welcome to the Sinatulator</h1>
  <h4>Select what you want to sinatulate</h4>
  <ul>
    <li><a href="/calculator">See Every Math Ever Done</a></li>
  </ul>'
end

get '/calculator' do
  addition = calculate[:add].to_s
  subtraction = calculate[:sub].to_s
  times = calculate[:times].to_s
  division = calculate[:divide].to_s
  "Addition: #{addition}<br />
  Division: #{subtraction}<br />
  Multiplication: #{times}<br />
  Division: #{division}<br />"
end

### addition

post '/calculator/add' do
  # binding.pry

  # finds the sum of the 2 numbers
  sum = params[:num1].to_i + params[:num2].to_i

  # adds all 4 values to a hash
  addition = {
    :num1 => params[:num1],
    :operator => "+",
    :num2 => params[:num2],
    :sum => sum
  }

  # pushes the addition array of the addition array of the calculate hash
  calculate[:add] << addition
  addition.to_s
end

get '/calculator/add' do
  addition = calculate[:add].to_s
  "Addition: #{addition}"
  # calculate.values.each.split('+')
end

### subtraction

post '/calculator/sub' do
  # binding.pry

  # finds the sum of the 2 numbers
  difference = params[:num1].to_i - params[:num2].to_i

  # adds all 4 values to a hash
  subtraction = {
    :num1 => params[:num1],
    :operator => "-",
    :num2 => params[:num2],
    :sum => sum
  }

  # pushes the addition array of the addition array of the calculate hash
  calculate[:sub] << subtraction
  subtraction.to_s
end

### multiply

post '/calculator/times' do
  # binding.pry

  # finds the sum of the 2 numbers
  product = params[:num1].to_i * params[:num2].to_i

  # adds all 4 values to a hash
  product = {
    :num1 => params[:num1],
    :operator => "*",
    :num2 => params[:num2],
    :result => product
  }

  # pushes the addition array of the addition array of the calculate hash
  calculate[:times] << product
  product.to_s
end

get '/calculator/times' do
  multiply = calculate[:times].to_s
  "Multiplication: #{multiply}"
  # calculate.values.each.split('+')
end

### multiply

post '/calculator/divide' do
  # binding.pry

  # finds the sum of the 2 numbers
  quotient = params[:num1].to_i / params[:num2].to_i

  # adds all 4 values to a hash
  quotient = {
    :num1 => params[:num1],
    :operator => "/",
    :num2 => params[:num2],
    :result => quotient
  }

  # pushes the addition array of the addition array of the calculate hash
  calculate[:divide] << quotient
  quotient.to_s
end

get "/calculator/:id" do
  all_math = calculate.to_a
  id = calculate[:id].to_i
  all_math[id]
end
