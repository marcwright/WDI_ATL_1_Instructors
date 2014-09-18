require 'pry'

students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#students is an array
#.each method in order to iterate through every index:value in students[]
students.each do |student| #student is a placeholder/local variable that represents each item in the array as do loops through it
  puts "#{student} is learning to learn"
  #prints the following string the console, student is interpolated in
  puts "#{student} is the student in the #{students.index(student)} index"
  #Used Ruby docs to find the .index method. Interpolates the index of current student value
end #ends the do loop

#Used Ruby docs to find .count method which counts the elements in a given array
puts "There are #{students.count} students in this array."

#Use the .select method to iterate through the array and find "Stephen Stanwood"

students.select do |student|
  #Used if statement with .include to check if the value in student is equal to "Stephen Stanwood"
  if student.include?("Stephen Stanwood")
    puts "Stephen Stanwood's index is #{students.index(student)}"
    #prints out the index of "Stephen Stanwood" to the console
  end
end

students.select do |student|
  #Used if statement with .include to check if the value in student includes a "J"
  if student.chr == "J"
    puts "#{student}"
    #prints out the "J" students to the console
  end
end





