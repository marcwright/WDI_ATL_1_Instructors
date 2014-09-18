puts "What is your name?"

name = gets.chomp

puts "What is your age?"

age = gets.chomp

puts "Have you had your birthday yet this year? (y/n)"

birthday_this_year = gets.chomp.upcase

current_year = Time.now.year


if birthday_this_year == "Y"
	birth_year = current_year - age.to_i
else
	birth_year = current_year - (age.to_i +  1)
end


puts "Hello, #{name}! You were born in #{birth_year}"