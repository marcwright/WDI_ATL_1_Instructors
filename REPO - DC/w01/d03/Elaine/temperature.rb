celsius_temperature = 0

def convert_to_fahrenheit(celsius_temperature)
  fahrenheit_temperature = celsius_temperature * 9 / 5 + 32
  return fahrenheit_temperature
end

def convert_to_kelvin(celsius_temperature)
  kelvin_temperature = celsius_temperature + 273
  return kelvin_temperature
end

puts "Enter a temperature in Celsius:"
celsius_temperature = gets.to_f

puts "Would you like to convert the temperature to Fahrenheit or Kelvin?"
convert_to = gets.chomp.downcase

puts ""

if convert_to == "fahrenheit"
  temperature = convert_to_fahrenheit(celsius_temperature)
  puts "Converted temperature = #{temperature} degrees F"
elsif convert_to == "kelvin"
  temperature = convert_to_kelvin(celsius_temperature)
  puts "Converted temperature = #{temperature} Kelvins"
else
end


