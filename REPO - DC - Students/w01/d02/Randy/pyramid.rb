puts "What symbol should we make the pyramid out of?"
shape = gets.chomp
puts "How many rows?"
rows = gets.to_i
count = 0
while count <= rows
	max_width = (2*rows+1)
	puts (shape*(2*count+1)).center(max_width)
	count +=1
end
