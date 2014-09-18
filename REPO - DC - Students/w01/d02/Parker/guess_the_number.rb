# puts "Please guess a number...? Thank you!"
# answer = gets.to.i
	
# while answer != 4
# puts "Guess again!"
# answer = gets.to_i
# end

secret_number = rand(11)

puts "Pick a number between 0 and 10"
guess = gets.to_i

while guess != secret_number
	if guess > secret_number
		puts "Too High"
	else
		puts "Too Low"
	end

	puts "Guess again dummy"
	guess = gets.to_i
	number_of_guesses = number number_of_guesses + 1 
end

puts "You win! HIGH FIVE! It only took you #{number_of_guesses} guesses"