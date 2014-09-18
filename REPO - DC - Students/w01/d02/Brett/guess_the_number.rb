number = rand(11)

puts "Pick a number between 0 and 10:"
  guess = gets.to_i

count = 1
while guess != number

  if guess > number
    puts "Too high."
  else
    puts "Too low."
  end

  puts "Guess again dummy:"
  guess = gets.to_i
  count += 1
end

puts "Congratulations! It took you #{count} guesses."
