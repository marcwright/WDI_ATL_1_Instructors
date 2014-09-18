def get_response(query)
  puts query
  answer = gets.chomp
  return answer
end

def convert_to_fahrenheit(celsius)
  fahrenheit = celsius * (9/5) + 32
  return fahrenheit
end

def convert_to_kelvin(celsius)
  kelvin = celsius + 273.15
end

puts "Enter a temperature in Celsius."
celsius = gets.to_f

ans = get_response("Would you like to convert to Fahrenheit or Kelvin?").downcase
if ans == "fahrenheit"
  new_temp = convert_to_fahrenheit(celsius)
  puts "Your temperature in Fahrenheit is #{new_temp}"
elsif ans == "kelvin"
  new_temp = convert_to_kelvin(celsius)
  puts "Your temperature in Kelvin is #{new_temp}"
end
