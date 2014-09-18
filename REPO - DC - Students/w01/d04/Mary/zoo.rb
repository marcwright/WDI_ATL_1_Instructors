
puts "Welcome to the JUNGLE!"
puts "1 if you want to add an animal"
puts "2 if you want to see the animals"
puts "q if you want to quit"
answer = gets.chomp

if answer == "1"
  f = File.new("animals.txt", "a+") #creates a new file in directory; tells it filename we want and mode (in this case, "a+")
    puts "What is the animal species?"
    species = gets.chomp
    puts "Whats's his name?"
    name = gets.chomp
    animal = [species, name]
    f.puts animal.join(",")
  f.close
elsif answer == "2"
  f = File.new("animals.txt", "r") #read mode
    f.each_line do |line|
      animal_array = line.chomp.split(",")
      puts "Hi I'm #{animal_array[1]}, the #{animal_array[0]}"
    end
  f.close
#prints each line of file back out
else

end


