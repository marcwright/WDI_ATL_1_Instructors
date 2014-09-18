puts "Please guess a number between 0 and 10"
user_number = gets.to_i
guesses = 1

comp_number = rand(11)

while user_number != comp_number
  puts "Guess again"
  if user_number > comp_number
    puts "Too high"
  else
    puts "Too low"
  end
  user_number = gets.to_i
  guesses += 1
end
puts "You got it in #{guesses} tries"

