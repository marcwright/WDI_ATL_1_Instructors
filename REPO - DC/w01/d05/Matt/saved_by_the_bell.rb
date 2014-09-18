require "pry"

students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

# students is an array

# use each method to print all names + string
students.each do |student_name|
  puts "#{student_name} is learning to learn."
end

# use each_with_index method to print all names index within the array
# local variables for name and index are interpolated within the string
students.each_with_index do |student_name, student_index|
  puts "#{student_name} is student #{student_index} in the index."
end

# to find the total number of students in the class, i used the count method
student_total = students.count do |student_total|
  student_total
end
puts "There are #{student_total} students in the class"

# use the index method to search for a value, then get the index
steve_dex = students.index('Stephen Stanwood')
puts "Stephen is the #{steve_dex} student in class"

# use index to find the 5th person in an array
fifth_person = students[4]
puts "#{students[4]} is the fifth person in the array"

# j_names = students.each |j|
#   if j.include?('j')
#     puts "#{j}"
#   end
# end


binding.pry
