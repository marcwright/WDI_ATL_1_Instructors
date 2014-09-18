number = rand(11)

puts "Guess a number from 0 to 10."
guess = gets.to_i

counter = 1
while guess != number
	if guess < number
		puts "Your number was too low. Guess again!"
  	else
  		puts "Your number was too high. Guess again!"
  	end
  	guess = gets.to_i
	counter += 1
 end

puts "Your guess of #{number} was correct!"
puts "It took you #{counter} guesses."