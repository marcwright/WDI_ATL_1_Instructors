puts "What is the current temperature?"
temp = gets.to_i
puts "Is the A/C functional? (yes or no)"
answer = gets.chomp.downcase
puts "What temperature would you prefer?"
prefer = gets.to_i

if answer == "yes" && temp > prefer
  puts "Turn on the A/C please"
elsif answer == "no" && temp > prefer
  puts "Fix the A/C now! It's hot!"
elsif answer == "no" && temp < prefer
  puts "Fix the A/C whenever you have the chance... It's cool..."
end
