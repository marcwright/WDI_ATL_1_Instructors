#below is an array of students, containing string values with the student name as elements

students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#for each element in the above array, this block prints a statement interpolating (student_name) into a statement "student_name is learning to learn"

students.each do |student_name|
  puts "#{student_name} is learning to learn."
end

#for each element in the array, this block gets the index value and the string from the array and interpolates them both into a statement

students.each_with_index do |student_name, students_index_value|
  puts "#{student_name} is the #{students_index_value} in the class"
end






