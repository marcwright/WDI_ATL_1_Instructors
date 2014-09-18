# ### Celsius Temperature Converter
# - This should be done in a new file called `temperature.rb`
# - Write `convert_to_fahrenheit` and `convert_to_kelvin` methods that will each take a temperature in Celsius as a parameter and return the converted temperature.
# - Once you have these methods written, a program that does the following:
#   - The user should be asked to enter a temperature in Celsius
#   - The user should be asked to enter if they want to convert the temperature to Fahrenheit or Kelvin
#   - After these have been entered, the user should be told what the converted temperature is

# #####Bonus
# - Expand your temperature converter so that you can convert a temperature from any temperature scale (C, F, K) to any temperature scale (C, F, K) as determined by the user. If you get this working, think about ways you could refactor your code to make it either simpler or more readable.

def ask_until question, answer_pattern
  # keep asking 'question' until user's response matches the regexp 'answer_pattern'

  puts question
  answer = gets.chomp
  ask_until question, answer_pattern until answer.match(answer_pattern)
  return answer
end

def convert_to_c temp, start_unit
  temp = temp.to_f
  final_temp = case start_unit.upcase
    when "C" then temp
    when "F" then (temp - 32) * 5/9
    when "K" then temp - 273.15
    else nil
  end
end

def convert_to_f temp, start_unit
  temp = temp.to_f
  final_temp = case start_unit.upcase
    when "C" then temp * 9/5 + 32
    when "F" then temp
    when "K" then temp * 9/5 - 459.67
    else nil
  end
end

def convert_to_k temp, start_unit
  temp = temp.to_f
  final_temp = case start_unit.upcase
    when "C" then 273.15 + temp
    when "F" then (temp + 459.67) * 5/9
    when "K" then temp
    else nil
  end
end

def ask_conv_pref
  # ask user for 3 things: starting temp & unit, and the desired temp and returns it in a hash

  start_temp = ask_until("Please enter a temperature and its unit (C, F, K), e.g. 23C:", /^[0-9]+\s*[cfk]$/i ).partition(/[cfk]/i)  #=> starting temp [temp magnitude, temp unit]
  final_unit = ask_until "Do you want to convert it to (C)elsius, (F)ahrenheit, or (K)elvin?", /^[cfk]$/i #=> unit to convert to
  {
    start_temp: start_temp[0],
    start_unit: start_temp[1],
    final_unit: final_unit
  }
end

def convert_temp start_temp, start_unit, final_unit
  # converts temperature based on a starting temp, unit, and desired unit
  # returns an array [temp magnitude, temp unit]

  converted_temp = []
  converted_temp[1] = final_unit.upcase
  converted_temp[0] = case converted_temp[1]
    when "C" then convert_to_c start_temp, start_unit
    when "F" then convert_to_f start_temp, start_unit
    when "K" then convert_to_k start_temp, start_unit
  end
  return converted_temp
end

puts "This is a calculator that converts Celius temperature to either Fahrenheit or Kelvin."
conv_request = ask_conv_pref
final_temp = convert_temp(conv_request[:start_temp], conv_request[:start_unit], conv_request[:final_unit])
puts "#{conv_request[:start_temp]}#{conv_request[:start_unit]} is equal to #{final_temp[0]}#{final_temp[1]}."
