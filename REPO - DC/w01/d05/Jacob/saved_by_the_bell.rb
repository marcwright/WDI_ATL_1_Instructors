students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#1. Identify what type of data structure 'students' is.
  #'students' is an array that contains the names of all of the studets in the DC WDI.

#2. Print "STUDENT_NAME is learning to learn." for every student in the class.
  #use the .each method on 'students' in order to do this,
  #since .each puts lines to the screen as opposed to creating a new array.

students.each do |student|
  puts "#{student} is learning to learn."
end

#3. Print "STUDENT_NAME is the student in the STUDENTS_INDEX_VALUE index" for every student in the class.
  #use .each for this as well.

students.each do |student|
  index = students.index(student)
  puts "#{student} is the student in the #{index} index."
end

#4. Find and print the number of students in the class.
  #establish an initial counter value of 0 and then enter a while loop that operates
  #while the counter is < students.length. print the counter outside of the loop.

#5. Finds and prints the index of "Stephen Stanwood."
  puts students.index("Stephen Stanwood")

#6. Print the fifth person.
  puts students[4]

#7. Print all of the "J" names.
  #use .index to create a sublist, access the first letter of each person's name
  #by using students[index][0]==J?
