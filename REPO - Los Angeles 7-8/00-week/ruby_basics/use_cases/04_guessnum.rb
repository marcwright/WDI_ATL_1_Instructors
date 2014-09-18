require 'pry'

actualnumber = rand(1..10)
num_guesses = 0

binding.pry

loop do 
	puts "Guess a number from 1 to 10."
	number = gets.chomp.to_i
	num_guesses +=1

	unless number == actualnumber
		message = if number > actualnumber
					"Too high"
				else
					"Too low"
				end
		puts message
	else
		puts "You got it!"
		puts "It took you #{num_guesses} guesses."
		exit
	end	
end
