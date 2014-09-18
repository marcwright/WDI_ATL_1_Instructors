students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

# Students is an array.

puts "students is an array."
puts ""

# .each do method to print statement.

students.each do |student|
  puts "#{students} is learning to learn."
end

puts ""

# Define .each do method and call it later + index value.

students.each do |student|
  puts "#{students} is the student in the #{students.index(student)} index."
end

puts ""

# students.length to find number of students.

# students
