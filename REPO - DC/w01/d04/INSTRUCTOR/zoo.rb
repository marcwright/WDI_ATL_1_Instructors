require 'pry'

puts "Welcome to the JUNGLE!"
puts "(1) if you want to add an animal"
puts "(2) if you want to see the animals"
puts "(q) if you want to quit"
answer = gets.chomp

if answer == "1"
  f = File.new("animals.txt", "a+")
    puts "What is the animal species?"
    species = gets.chomp
    puts "What is it\'s name?"
    name = gets.chomp
    animal = [species, name]
    f.puts animal.join(",")
  f.close
elsif answer == "2"
  f = File.new("animals.txt", "r")
    f.each_line do |line|
      animal_data = line.chomp.split(",")
      puts "I\'m #{animal_data[1]} the #{animal_data[0]}"
    end
  f.close
else
end