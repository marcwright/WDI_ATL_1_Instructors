number = rand(11)
puts "Guess a number!"
guess = gets.to_i
count = 1
while guess != number
  puts "Guess again dummy!"
	if  guess > number
		puts "Too high!"
	elsif guess < number
		puts "Too low!"
	else
		puts "I'm pretty sure that's not a number!"
	end
  guess = gets.to_i
  count +=1
end
puts "Congrats! Cheater..."
puts "It only took you #{count} guesses"