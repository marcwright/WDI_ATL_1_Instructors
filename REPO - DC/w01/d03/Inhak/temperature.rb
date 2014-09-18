
def convert_to_farenheit(cels)
  return (9 * cels)/5 + 32
end

def convert_to_kelvin(cels)
  return cels + 273
end

puts "Enter a temperature (in Celsius)"
answer = gets.to_f
puts "Would you like to convert to farenheit or kelvin? (enter F or K)"
option = gets.chomp.downcase

if option == "f"
  faren = convert_to_farenheit(answer)
  puts "it is #{faren} degrees Farenheit"
else
  kelv = convert_to_kelvin(answer)
  puts "it is #{kelv} degrees Kelvin"
end
