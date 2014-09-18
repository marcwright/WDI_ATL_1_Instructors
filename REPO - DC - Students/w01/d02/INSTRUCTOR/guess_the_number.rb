secret_number = rand(11)

puts "Pick a number between 0 and 10"
guess = gets.to_i
number_of_guesses = 1

while guess != secret_number
  if guess > secret_number
    puts "Too high!"
  else
    puts "Too low!"
  end

  puts "Guess again dummy"
  guess = gets.to_i
  number_of_guesses = number_of_guesses + 1
end

puts "You win! HIGH FIVE! It only took you #{number_of_guesses} guesses"