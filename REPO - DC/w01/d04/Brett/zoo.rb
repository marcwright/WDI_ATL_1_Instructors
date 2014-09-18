require 'pry'

puts "Welcome to the zoo!"
puts "What would you like to do?"
puts "ADD an animal"
puts "SEE the animals"
puts "q if you want to quit"
answer = gets.chomp.upcase

if answer == "ADD"
f = File.new("animals.txt", "a+")
  puts "What is the animal species?"
  species = gets.chomp
  puts "What is it's name?"
  name = gets.chomp
  animal = [species, name]
  f.puts animal.join(",")
f.close

elsif answer == "SEE"
f = File.new("animals.txt", "r")
  f.each_line do |line|
    animal_data = line.chomp.split(",")
    puts "Hi, I'm #{animal_data[1]} the #{animal_data[0]}!"
  end
f.close

else
end
