students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#students is an array. I want to go through each of the students and print out the same thing using their name. use each to loop through and print the same thing for each student
students.each do |student_name|
  puts "#{student_name} is learning to learn."
end

#same thing as above but I also want to use their index in my string. Use .index to access this.
students.each do |student_name|
  puts "#{student_name} is the student in the #{students.index(student_name)} index."
end

# To find the number of students, I can call the .length method on the array of the students' names.
puts students.length

# to find Stephen's index, I'll use .index method
puts students.index("Stephen Stanwood")

# to print the 5th person in array, I'll use the index of 4 to access their name in the array
puts students[4]

# to print out the students whos names start with "J", I'll use the .select method. I had to look up how to determine if a string starts with a certain prefix/letter, which is .start_with?
students.select do |student_name|
  puts student_name if student_name.start_with?("J")
end

