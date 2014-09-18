require 'pry'

puts "Welcome to the jungle!"
puts "(1) If you want to add an animal"
puts "(2) if you want to see the animals"
puts "(q) if you want to quit"
answer = gets.chomp

if answer == "1"
  f = File.new("animals.txt", "a+")
    puts "What is your favorite animal?"
    puts "What is the animal\'s species?"
      species = gets.chomp
    puts "What is the animal\'s name?"
      name = gets.chomp
    animal = [species, name]
    f.puts animal.join(", ")
  f.close

elsif answer == "2"

# Array

# f is a variable which pulls the data through the File.new (file stream) 
# http://www.ruby-doc.org/core-2.1.1/File.html
# http://www.ruby-doc.org/core-2.1.1/IO.html
f = File.new("animals.txt", "r")
# Variable / is being searched by 'each' aka 'each_line' and we are 
#passing each |line| into the following block
 f.each_line do |line| #'line' is the arguement
# splits the string into SUBSTRING and returns it into
  # an array
  animal_data = line.chomp.split(", ") # takes resulting array and stores it
  # our new variable 'animal_data'
  puts "I am #{animal_data[1]} the #{animal_data[0]}" #so we are 
  # calling the indexed values and displaying them
end
f.close
else
end
