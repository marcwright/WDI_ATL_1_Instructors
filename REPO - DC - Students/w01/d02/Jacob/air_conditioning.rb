puts "What is the current temperature?"
current_temp = gets.chomp
puts "Is the A/C functional?"
functional = gets.chomp.downcase
puts "What temperature would you like it to be?"
desired_temp = gets.chomp
if functional == "yes" && current_temp > desired_temp
  puts "Turn on the A/C, please."
elsif functional == "no" && current_temp > desired_temp
  puts "Fix the A/C now! It's hot!"
elsif functional == "no" && current_temp < desired_temp
  puts "Fix the A/C whenever you have the chance... It's cool..."
end
