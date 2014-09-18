def convert_to_farenheit(temp_celcius)
  return ((temp_celcius.to_f * 9) / 5) + 32
end

def convert_to_kelvin(temp_celcius)
  return (temp_celcius.to_f + 273.15)
end

puts "Please enter a temperature in Celcius degrees."
temp_celcius = gets.chomp

puts "Would you like to convert to Farenheit or Kelvin?"
convert = gets.chomp.downcase

if convert == "farenheit"
  puts "The answer is #{convert_to_farenheit(temp_celcius)} degrees Farenheit"
elsif convert == "kelvin"
  puts "The answer is #{convert_to_kelvin(temp_celcius)} degrees Kelvin"
end
