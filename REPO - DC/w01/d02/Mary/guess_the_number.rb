number = rand(11)

puts "Guess the integer between 0 and 10."
guess = gets.to_i
count = 1

while guess != number
  if guess > number
    puts "Too high! Please guess again."
  else
    puts "Too low! Please guess again."
  end
  guess = gets.to_i
  count = count + 1
end
puts "Congrats, you guessed correctly! It only took you #{count} guesses!"
