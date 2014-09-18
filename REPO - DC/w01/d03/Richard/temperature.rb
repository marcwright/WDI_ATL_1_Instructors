def convert_to_fahrenheit(cel_temp)
  f_temp = cel_temp * 1.8 + 32
  return f_temp
end

# puts convert_to_fahrenheit(100)
# puts convert_to_fahrenheit(0)
# puts convert_to_fahrenheit(-273)
# puts convert_to_fahrenheit(20)


def convert_to_kelvin(cel_temp)
  k_temp = (cel_temp + 273)
  return k_temp
end


puts "What temperature (in celsius) would you like to convert?"
cel_temp = gets.to_f

puts "Do you want to convert to Kelvin or Fahrenheit?"
temp = gets.chomp.downcase

if temp.include? "f"
  puts convert_to_fahrenheit(cel_temp)
else
  puts convert_to_kelvin(cel_temp)
end
