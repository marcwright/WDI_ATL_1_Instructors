random_num = rand(11)

puts "The guessing game\n\n"
puts "Guess a random number"
guess_num = gets.to_i
guess_count = 1

while guess_num != random_num
  if guess_num > random_num
    puts "Your guess was too high. That was your #{guess_count} attempt."
  else
    puts "Your guess was too low. That was your #{guess_count} attempt."
  end
  puts "\nYa blew it, guess again!"
  guess_num = gets.to_i
  guess_count = guess_count + 1
end

puts "Good guess, it only took #{guess_count} guesses"
