puts "What is the current temperature?"
temp_now = gets.to_i
puts "Does the A/C work?"
operational = gets.chomp.downcase
puts "What temperature do you want it to be?"
desired_temperature = gets.to_i

if operational == "yes"
  if temp_now > desired_temperature
    puts "Turn on the A/C please."
  end
else
  if temp_now > desired_temperature
    puts "turn on the A/C! It's hot!"
  else
    puts "Fix the A/C whenever you have the chance... It's cool..."
  end
end
