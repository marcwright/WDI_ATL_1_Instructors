

puts "1 to add"
puts "2 to see"
puts "q to quit"

answer = gets.chomp

if answer == "1"
	f = File.new("Animals.txt", "a+")
	puts "What is the creature name?"
	creature = gets.chomp
	puts "what is its name?"
	name = gets.chomp
	animal = [creature, name]
	f.puts animal.join(", ")
f.close

elsif answer == "2"
f = File.new("Animals.txt", "r") #read only File
f.each_line do |line| 
animal_data = line.chomp.split(", ")
puts "Im #{animal_data[1]} the #{animal_data[0]}"
end
f.close

else 
	end



#this reads the file "animals" and puts out each line.