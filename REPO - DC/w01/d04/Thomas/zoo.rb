# require "pry"

puts "welcome to the JUNGLE!"
puts "1 if you want to add an animal"
puts "2 if you want to see the animals"
puts "Q if you want to quit"

answer = gets.chomp

if answer = "1"
f = File.new("animals.txt", "a+")
  puts "what is the animal species"
  species = gets.chomp
  puts "what is its name?"
  name = gets.chomp
  puts "what is your favorite animal"
  answer = gets.chomp
  f.puts animal.join(" ")
elsif answer = "2"
f = File.new("animals.txt", "r")
f.each_line do |line|
	  puts line
    end
  f.close
else
end
# f. = File.new("animals.txt", "r")
  # binding.pry