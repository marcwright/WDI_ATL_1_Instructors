# Ask the user what the current temperature is, 
# if the A/C is functional, and what temperature 
# they wish it was.
puts "What is the current temperature?"
current_temp = gets.to_i

puts "Is the A/C functional?"
working_ac = gets.chomp.downcase

puts "What temperature do you prefer?"
desired_temp = gets.to_i
# If the airconditioner is functional and the 
# current temperature is above the the desired temperature
#... display "Turn on the A/C Please"
if working_ac == "yes" && current_temp > desired_temp
  puts "Turn on the A/C please"

# If the airconditioner is non-functional 
# and the current temperature is above the the 
# desired temperature... display "Fix the A/C now!  It's hot!"

elsif working_ac == "no" && current_temp >= desired_temp
  puts "Fix the A/C now!  It\'s hot!"

# If the airconditioner is non-functional and the 
# current temperature is below the the desired temperature... 
# display "Fix the A/C whenever you have the chance...  It's cool..."

elsif working_ac == "no"
  puts "Fix the A/C whenever you have the chance...  It\'s cool..."

else
  puts "It is really cold."
end
