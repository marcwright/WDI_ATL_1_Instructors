require 'pry'

students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

# Identify the following list for the user
puts "GA DC Students:"
puts " "

# Print the list and add the "... is learning to learn." phrase to each name.
students.each do |stu_list|
  puts "#{stu_list} is learning to learn."
end

# Number the students on the list and print
puts " "
puts "Numbered Student List:"
puts " "
students.each_with_index {|index, val| puts "#{val}. #{index}"}







binding pry

