puts "What is the current temp?"
temp = gets.to_i

puts "Is the AC working? (True or False)"
working_ac = gets.chomp.downcase

puts "What would you like the temp to be?"
ideal_temp = gets.chomp.to_i

if working_ac == "true" && temp > ideal_temp
  puts "Turn on the A/C please."

elsif working_ac == "false" && temp > ideal_temp
  puts "Fix the AC now!  It\'s hot!"
elsif working_ac == "false" && temp < ideal_temp
  puts "Fix the AC whenever you have a chance... It\'s cool..."
else puts "AC is a waste anyway"

end
