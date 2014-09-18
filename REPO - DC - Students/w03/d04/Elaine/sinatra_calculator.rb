require 'sinatra'
require 'sinatra/reloader'
require 'pry'

past_calculations = []

first_number = {}
second_number = {}

get '/' do
  "<h1>Welcome to the calculator!</h1><br><h2>Add the path <i>/calculator</i> to see past calculations.<br> Enter <i>/calculator/add</i> followed by your two numbers separated by <i>/</i> to add them.<br>Do the same for <i>subtract, multply, and divide</i>.</h2>"
end

get '/calculator' do

  "<h1>Past Calculations:<p></p><p>" + past_calculations.join("<br>")
end

get '/calculator/:id' do
  id = params[:id].to_i - 1
  if id + 1 <= past_calculations.length
    "<h1>Historical Calculation:<br>#{past_calculations[id]}</h1>"
  else
    "<h1>The id, #{params[:id]}, wasn't found.</h1>"
  end
end

get '/calculator/add' do
  "<h1>What would you like to add?</h1>"
end

get '/calculator/add/:number1/:number2' do
  sum = params[:number1].to_i + params[:number2].to_i

  past_calculations.push("<h1>#{params[:number1]} + #{params[:number2]} = #{sum}</h1>")

  "<h1>Addition<br>#{params[:number1]} + #{params[:number2]} = #{sum}</h1>"
end

get '/calculator/subtract/:number1/:number2' do
  difference = params[:number1].to_i - params[:number2].to_i

  past_calculations.push("<h1>#{params[:number1]} - #{params[:number2]} = #{difference}</h1>")

  "<h1>Subtraction<br>#{params[:number1]} - #{params[:number2]} = #{difference}</h1>"
end

get '/calculator/multiply/:number1/:number2' do
  product = params[:number1].to_i * params[:number2].to_i

  past_calculations.push("<h1>#{params[:number1]} x #{params[:number2]} = #{product}</h1>")

  "<h1>Multiplication<br>#{params[:number1]} x #{params[:number2]} = #{product}</h1>"
end

get '/calculator/divide/:number1/:number2' do
  quotient =  params[:number1].to_i / params[:number2].to_i
  remainder = params[:number1].to_i % params[:number2].to_i

  past_calculations.push("<h1>#{params[:number1]} / #{params[:number2]} = #{quotient} , Remainder: #{remainder}</h1>")

  if remainder == 0
    "<h1>Division<br>#{params[:number1]} / #{params[:number2]} = #{quotient}</h1>"
  else
    "<h1>Division<br>#{params[:number1]} / #{params[:number2]} = #{quotient} <br>Remainder: #{remainder}</h1>"
  end
end

# post '/calculator/add' do

#   first_new_key = first_number.keys.last + 1
#   second_new_key = second_number.keys.last + 1

#   first_number[first_new_key] = params[:number1]
#   second_number[second_new_key] = params[:number2]

#   sum = first_number.values.last.to_i + second_number.values.last.to_i

#   "#{first_number.values.last} + #{second_number.values.last} = #{sum}"
# end
