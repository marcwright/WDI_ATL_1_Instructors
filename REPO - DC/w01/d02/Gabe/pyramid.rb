puts "PYRAMID MAKER".center(20)
puts "   by Gabe Snyder   ".center(20)
puts "--------------------".center(20)
sleep 1
puts ""

puts "Please enter a character, and I shall build thee yon pyramide...".center(20)
puts "character:"
sleep 1

symbol = gets.chomp

puts "how many rows high shall yon pyramide stande?...".center(20)
puts "rows high:"
sleep 1

rows = gets.chomp.to_i

counter_thing = 0
max_width = 2 * rows + 1

while counter_thing <= rows + 1
	
	puts (symbol * ( 2 * counter_thing + 1)).center(max_width + 5)
	
	counter_thing = counter_thing + 1
end
puts "BEHOLD!"




puts "Flip upside down? Y / N "

yn = gets.chomp.downcase
counter_thing = rows
while yn == "y" && counter_thing >= rows
puts (symbol * (counter_thing)).center(rows - counter_thing)
	
	counter_thing = counter_thing - 1
end


puts "BEHOLD!"


