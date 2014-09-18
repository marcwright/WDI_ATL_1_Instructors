puts "GUESS-THE-NUMBER-GAME"
puts "by Gabe Snyder"
puts "---------------------"
sleep 1
puts ""

number = rand(1..100)
count = 1

puts "I'm thinking of a number between 1 and 100..."
puts "take a guess :"

guess = gets.to_i

while guess != number && guess > number
	
	puts " Thats guess \# #{count}. Nope, too high! Try again!"
	count = count +1
	guess = gets.to_i
end

while guess != number && guess < number
	
	puts " Thats guess \# #{count}. Nope, too low! Try again!"
	count = count +1
	guess = gets.to_i
end

if guess = number
	
	puts "Thats guess \# #{count}. Hooray! YOU GUESSED IT!"
	
end
