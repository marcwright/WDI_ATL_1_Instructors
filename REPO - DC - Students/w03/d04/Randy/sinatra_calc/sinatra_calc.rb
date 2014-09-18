require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  host: "localhost",
  username: "Randy",
  password: "",
  database: "calculator_db"
)

class Calculation < ActiveRecord::Base
end



# When they visit the homepage (GET) (/), a user should see some text to welcome them to the calculator
get '/' do
  "Welcome to the Calculator!"
end

# A user can see a the third calculation they've done in the past by visiting /calculator/3 (GET). Same with any other number. If the calculation doesn't exist, they should see text saying that the id wasn't found.
get '/calculator/:id' do
  identify = params[:id].to_i
  # return_string = "Your ##{params[:id].to_s} calculation was"
  # Calculation.all.each do |calc|
  #   if calc.id == indentify
  #     calc.hash_value.to_s
  #   end
  # SO CLOSE COULD NOT GET THIS TO RETURN. :(
  end
end
# A user can POST an Addition calculation to /calculator/add by providing 2 numbers as parameters.
  post '/calculator/add' do
    result = params[:num1].to_i + params[:num2].to_i
    Calculation.create(hash_value: "#{params[:num1]} + #{params[:num2]} = #{result}")
    result.to_s
  end

  post '/calculator/subtract' do
    result = params[:num1].to_i - params[:num2].to_i
    Calculation.create(hash_value: "#{params[:num1]} - #{params[:num2]} = #{result}")
    result.to_s
  end

  post '/calculator/multiply' do
    result = params[:num1].to_i * params[:num2].to_i
    Calculation.create(hash_value: "#{params[:num1]} * #{params[:num2]} = #{result}")
    result.to_s
  end

  post '/calculator/divide' do
    result = params[:num1].to_i / params[:num2].to_i
    Calculation.create(hash_value: "#{params[:num1]} / #{params[:num2]} = #{result}")
    result.to_s
  end
# Use the POSTman Chrome extension to try out your POST

# Same with /calculator/subtract, /calculator/multiply, and /calculator/divide

# The calculator can add, subtract, multiply and divide.

# When they visit the /calculator page (GET), a user should be able to see all of the calculations that have been done in the past
get '/calculator' do
  final_string = "<h1>Here is a list of all your calculations so far:</h1>"
  Calculation.all.each do |calc|
    final_string += calc.hash_value.to_s + "  \n  "
  end
  #<p>#{calculations.values}</p>
  final_string
end



