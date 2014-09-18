#a while loop for entering names into an array, called 'names'

names = []

while true

	puts " #{names.length} so far. enter a name or type 'done'."
	name_to_add = gets.chomp.downcase

	break if name_to_add == "done"
	names.push(name_to_add) #adds the name input to array 'names'


end

puts "you collected #{names.length} names. "
puts "the names are #{names.join (', ')}."