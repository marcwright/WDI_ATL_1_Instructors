secret_number = rand(11)
puts "Guess the number"
guess = gets.to_i

while guess != number
	if guess > number
		puts "too high"
	else
		puts "too low"
	end
	puts "Guess Again!"
	guess = gets.to_i
end
puts "Congratulations, you read my mind"

