def conv_to_F (temp)
  puts "#{(temp * (9/5)) + 32} degrees Farenheit"
end

def conv_to_K (temp)
  puts "#{temp + 273} degrees Kelvin"
end

puts "Please enter a degree value in Celsius"
temp = gets.to_i
puts "Would you like to convert to K (Kelvin) or F (Farenheit)?"
ans = gets.chomp.downcase

if ans == "k"
  conv_to_K(temp)
elsif ans == "f"
  conv_to_F(temp)
end
