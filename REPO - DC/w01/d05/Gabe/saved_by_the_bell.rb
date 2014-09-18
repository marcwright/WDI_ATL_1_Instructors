#paste in an array, called students, containing the names of each student

students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#I need to make a new variable, called "learning_to_learn" which equals the array name, 
#student, and use the 'dot each' method to make the program DO iterate each through the array and 
#find each student name, and put out and interpolated sentence. then  i can close the block 
#with end. I dont need to print the variable 'learning_to_learn' below--the method 'each' already does this.

learning_to_learn = students.each do |students_name| 
	puts "#{students_name} is learning to learn."
end

#Next, i will make a variable "names_and_index_statement" and set it equal to array 'students'
#"dot each with index" 'do'. This looks inside the array and finds values and then their index numbers. 
#The local variable the block is looking for between the pipes, will be |names, indexnums|. then I can
#puts "STUDENT_NAME is the student in the STUDENTS_INDEX_VALUE index" for every student in the class"

names_and_index_statement = students.each_with_index do |names, indexnums|
	puts "#{names} is the student in the number #{indexnums} index"

end
puts "#{indexnums + 1 }) #{names}"

#now, I want to say how many students there are in the class. I will use the count method on a list of the names
#and put out the final number. It counts how many elements are 'on the list'. I can do this with method .count . 
#should be easy. I can even embed this in a sentence, with interpolate "#{}".

puts "there are #{students.count} students in the class."

#now I want to print out the name Stephen STanwood. I can see he is at index number 15. 
#I can simply tell ruby to print out the element at index 15 with the command string[what-number-index-i-want].


puts students[15]

