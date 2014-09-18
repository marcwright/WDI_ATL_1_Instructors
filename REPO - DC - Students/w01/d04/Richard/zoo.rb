require 'pry'
#opens a file


puts "Welcome to the JUNGLE!"
puts "(1) if you want to add an animal"
puts "(2) if you want to see the animals!"
puts "(3) if you want to quit"
answer = gets.chomp

if answer == "1"
  f = File.new("animals.txt", "a+")
  puts "What is your favorite animal?"
  animal = gets.chomp
  puts "What is it's name?"
  name = gets.chomp
  animal_array = [animal, name]
  f.puts animal_array.join(", ")
  f.close
elsif answer == '2'
f = File.new("animals.txt", "r")
  f.each_line do |line|
    animal_data = line.chomp.split(", ")
    puts "I\'m #{animal_data[1]} the #{animal_data[0]}"
  end
f.close
end
