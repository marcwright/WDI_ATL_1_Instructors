def convert_to_fahrenheit(celsius_input)
  return celsius_input * 9 / 5 + 32
end

def convert_to_kelvin(celsius_input)
  return celsius_input + 273.15
end

puts "Enter a temperature in celsius:"
celsius_input = gets.to_f

puts "Do you want to convert to Fahrenheit or Kelvin?"
choice = gets.chomp.downcase

if choice == "fahrenheit"
  puts convert_to_fahrenheit(celsius_input)
elsif choice == "kelvin"
  puts convert_to_kelvin(celsius_input)
else
  puts "Not a valid answer."
end

