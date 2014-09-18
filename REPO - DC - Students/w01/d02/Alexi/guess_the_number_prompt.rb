
# puts "Guess a number: "
# user_guess = gets.to_i
# comp_number = rand(11)


# while user_guess != comp_number
#   puts "Guess again your number is too "
#   if user_guess < comp_number
#     puts "low"
#   else puts "high"
#   end
#   user_guess = gets.to_i
# end
# puts "Congratulations!!!"

secret_number = rand(11)

puts "Pick a number between 0 and 10:"
guess = gets.to_i

number_of_guesses = 1

while guess != secret_number
  if guess > secret_number
    puts "too high!"
  else
    puts "too low"
  end
  puts "Guess again"
  guess = gets.to_i
  number_of_guesses = number_of_guesses + 1
end
puts "You guessed correctly!"
puts " It only took you #{number_of_guesses} guesses."
