require 'pry'

students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

# Students is an array.

puts ""
puts "students is an array."
puts ""

# .each do method to print statement.

puts "Statement Answer:"
puts ""

students.each do |student|
  puts "#{student} is learning to learn."
end

puts ""

# Define .each method and call it later + index value.

puts "Index Statement Answer:"
puts ""

students.each_with_index do |student, index|
  puts "#{student} is the student in the #{index} index."
end

puts ""

# students.length to find number of students.

puts students.length

# students

binding.pry
