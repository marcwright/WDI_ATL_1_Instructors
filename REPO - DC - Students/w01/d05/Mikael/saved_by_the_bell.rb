#define array of class
students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#print a line saying what type of data structure 'students' is
puts "students is a(n) #{students.class}."

#print a line to the console for every student in the class
students.each do |student|
  puts "#{student} is learning to learn."
end

#print a line of text for every value in the 'student' array
students.each_with_index do |student, index|
  puts "#{student} is the student in the #{index} index."
end

#print the number of students in the class
puts "The total number of students is #{students.length + 1}"

#find and print the index of Stephen Stanwood using the .index of that value
puts "Stephen Stanwood is at the #{students.index("Stephen Stanwood")} index."

#Find and print the fifth person in the array by printing whatever value is at index 4
puts "The fifth person is #{students[4]}"

#select only the students whose names begin with 'J' and print them all out using .select
jay = students.select do |student|
  student[0] == "J"
end
puts "#{jay.join(', ')}"

# 1. print an array of keys from a hash using the hash.keys method
# 2. use a method that returns the value at the specified key in the hash
# 3.
