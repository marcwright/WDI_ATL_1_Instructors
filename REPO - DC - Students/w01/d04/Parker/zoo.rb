puts" Welcome to the UNGLE!
puts "(1) if you want to add an animal"
puts "(2) if you want to see an animal"
puts "(q) if you want to quit"

f = File.new("animals.txt")
	puts "What is your favorite animal?"
	animal = gets.chomp
	f.puts animal 
f.close