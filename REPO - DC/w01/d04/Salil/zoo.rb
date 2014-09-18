

puts "Welcome to the Jungle!"
puts "(1) if you want to add an animal"
puts "(2) if you want to see the animals"
puts "(q) if you want to quit"
answer = gets.chomp

if answer == "1"
  f = File.new("animals.txt", "a+")
      puts "What is your favorite animal?"
        animal = gets.chomp
        f. puts animal
   f.close
elsif answer == "2"
  f = File.new("animals.txt", "r")
      f. each_line do |line|
        puts line
      end
   f.close
 else
end
