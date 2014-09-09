def menu
  puts "Welcome to the Zoo"
  puts "Enter (1) to add an animal to the zoo"
  puts "Enter (2) to see the animals we have"
  puts "Enter (3) to quit"
  return gets.chomp
end

answer = menu()

while answer != 3
  if answer == "1"
    write
  else
    read
  end
  answer = menu()
end

# append mode
f = File.new("animals.txt", "a+")
  puts "what is the animal name"
  animal = gets.chomp
  f.puts animal
f.close

# read mode
f = File.new("animals.txt", "r")

f.each_line do |line|
  puts "Hello #{line.chomp}!"
end

f.close

# can also be:
# File.open("animals.txt", "r") do |f|
#   f.each_line do |line|
#     puts "Hello #{line.chomp}!"
#   end
# end

# overwrite mode
# f = File.new("animals.txt", "w")
#   f.puts "Peter, Greg, and Travis"
# f.close

# for modes, see: http://www.ruby-doc.org/core-2.1.0/IO.html#method-c-new-label-IO+Open+Mode