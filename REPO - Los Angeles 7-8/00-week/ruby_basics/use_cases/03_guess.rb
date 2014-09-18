puts "Guess A, B, C, or D"

guess = gets.chomp.capitalize

answer = "A"

case guess 

	when "A"
		puts "You're right! A is the answer!"
	when "B"
		puts "You put B, A was right!"
	when "C"
		puts "You put C, A was right!"
	else
		puts "That's probably not the answer"
	end