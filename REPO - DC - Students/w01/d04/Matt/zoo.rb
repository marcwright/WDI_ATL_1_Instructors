require "pry"
answer = "0"
puts ""
puts "Welcome to the jungle\n"

while answer != "3"
  puts "1. If you want to add an animal"
  puts "2. If you want to see the animals"
  puts "3. If you want to leave"
  answer = gets.chomp
  if answer == "1"
    f = File.new("animals.txt", "a+")
      puts "What is the animal species?"
      species = gets.chomp
      puts "What is it\'s name?"
      name = gets.chomp
      animal = [species,name]
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
end
