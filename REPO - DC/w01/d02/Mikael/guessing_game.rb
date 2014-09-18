puts "Let's play a guessing game!"
puts "Enter a number between 0 and 10"
guess = gets.to_i
answer = rand(11)
count = 1
while guess != answer
  if guess > answer
    puts "Too high!"
  else
    puts "Too low!"
  end
  count += 1
  puts "Guess again!"
  guess = gets.to_i
end
puts "You got it! It took you #{count} guesses."
