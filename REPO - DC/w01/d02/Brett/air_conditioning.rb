puts "What's the current temperature?"
current_temp = gets.chomp

puts "Is the AC working [y/n]?"
working = gets.chomp.downcase

puts "What temperature would you like it to be?"
desired_temp = gets.chomp

if working == "y" && current_temp > desired_temp
  puts "Turn on the AC please"
elsif working == "n" && current_temp > desired_temp
  puts "Fix the AC now!"
elsif working == "n" && current_temp < desired_temp
  puts "Fix the AC whenever you have the chance... it's cool..."
else
  puts "No need for AC right now."
end
