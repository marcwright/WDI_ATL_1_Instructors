# I have an array filled with values or the string type

students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#I need have a puts statement that will return the data structure type for for data set (students).
# For this step I will use a method that can identify what type of object something is, using the .class method
puts "students is an #{students.class}"

#I need a puts statement that will return "STUDENT_NAME is learning code" where student name is each value within student.
#Here I will need a block that will go through my array and for each value, set that value equal to the variable STUDENT_Name. .each will be useful here.
students.each do |student_name|
	puts "#{student_name} is learning to code"	
end

#I need to take the array students, and for every value, I need to display that value and the associated index value for each student in students in the form: STUDENT_NAME is the student in the STUDENT_NAME_INDEX_VALUE index.
#For this I will use the .each method agin.
#Could and should use .each_with_index {|value, index|}
students.each do |name|
	puts "#{name} is the student in the #{students.index(name)} index"
end
students.each_with_index do |val, index|
	puts "#{val} is the student in the #{index} position"
end


#I need to find the total number of students in the class and then print that total out. Here Because I know the index value of the last student on the list will be (1) less than the totoal number of students in the class, I can use the .index and .last methods


puts "There are a total of #{(students.index(students.last) + 1)} students in the class."

#I need to be able to find the index value associate with "Stephan Stanwood" and print the value out.
#To do this I can use the .index method again.

puts "The index value for Stephen Stanwood is #{students.index("Stephen Stanwood")}"

#I need total print out the 5th student in the array. 
#To accomplish this, I will use the [index 4] to return the value associated with the 4 index value.

puts "The fifth student is #{students[4]}"

#I need to go through my array, and for each value that begins with the letter "J" I need to display those values.
#The .each method along with 

puts 









