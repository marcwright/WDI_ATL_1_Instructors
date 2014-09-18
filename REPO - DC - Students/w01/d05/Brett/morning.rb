
# this is an ARRAY of students
students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

# need to iterate through each name in the array and print it out in the following string ("STUDENt_NAME is trying to learn.")
# use .each for this

students.each do |student_name|
  puts "#{student_name} is trying to learn."
end

# need to iterate through each name in the array and print out the following string (NAME is the studen in the INDEX index value of the array ). Use .each for this too

students.each_with_index do |student_name, index|
  puts "#{student_name} is the student in the #{index} index value of the array."
end

# Count and print the number of students in the array. Use .count

puts students.count

# Find the string entry "Stephen Stanwood" in the array and print out it's index. Use .index

puts students.index("Stephen Stanwood")

# Print the 5th person in the array. Just call index value 4

puts students[4]

# Find all strings that begin with J. Use .select where first character = "J"

students.each do |student_name|
  name_char = student_name.split(//)
  if name_char[0] == "J"
    puts student_name
  end
end
