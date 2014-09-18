
if answer == "1"
#This opens a file, with read and write capabilities at the end of the file.
  f = File.new("animals.txt", "a+")
    puts "What is your favorite animal?"
    animal = gets.chomp
    #puts to the file.
    f.puts animal
  #closes the file.
  f.close
elsif answer == "2"
#reads the file to console.
  x = File.new("animals.txt", "r")
    f.each_line do |line|
      puts line
    end
  x.close
else
end
