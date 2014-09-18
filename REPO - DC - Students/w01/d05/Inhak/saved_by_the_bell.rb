#STUDENT is the variable which holds the array of students in our class.
students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#The first thing that will be done is a block will be called upon the students so that the block could print "STUDENT_NAME is learning to learn" for each of the elements within the array.
students.each do |student|
  puts "#{student} is learning to learn"
end

#For the next one, a similar block will be called, but this time it will put an index of the students after the student's name using .index, and also calling on the actual array first.
students.each_with_index do |student, index|
  puts "#{student} is the student in the #{index}"
end

#To find Stephen, I can use the .each to find Stephen and then use what the loop finds to find the index of where he is, filtering it using an if loop.
students.each do |student|
  if student == "Stephen Stanwood"
    puts "#{student}, #{students.index(student)}"
  end
end

#to find the fifth person, i will use the index value 4 to find them in the index.
puts students.find_index(4)

#to find all the people with J names and to print them, first I will look for a method that can find the first letter, and if I can't find that I will use a chain call on an array with in an array to treat the strings within the array as another string and ask if the [0] is == to J.
