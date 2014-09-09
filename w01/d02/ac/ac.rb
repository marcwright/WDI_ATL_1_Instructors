puts "What is the current temperature in Fahrenheit?"
temperature = gets.chomp.to_i
puts "Is the A/C in your room currently functional? Please enter yes or no"
ac_working = gets.chomp.downcase
puts "What temperature do you wish it was?"
preferred_temp = gets.chomp.to_i

if (preferred_temp < temperature) && (ac_working == "yes")
  puts "Turn on AC please"
elsif (preferred_temp < temperature) && (ac_working == "no")
  puts "Fix the AC now it's hot"
else
  puts "Fix the AC whenever you have a chance it's cool"
end