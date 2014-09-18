random_number = rand(11)

puts "Pick a number from 0 to 10 (inclusive)."
user_guess = gets.to_i

number_of_guess = 1

while user_guess != random_number
  if user_guess > random_number
    puts "Too high"
  else
    puts "Too low"
  end

  puts "Guess again."
  user_guess = gets.to_i
  number_of_guess += 1
end

puts "You win! It only took you #{number_of_guess} guesses!"
