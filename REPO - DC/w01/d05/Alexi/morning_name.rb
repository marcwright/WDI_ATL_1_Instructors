students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#Using a [???] we will determine what data type is inside the array.
# students.each do |student|
#   puts "#{student} " 
  #p students.class
# end
print "The variable \"students\" is an: "
p students.class


#We are going to search through an array grabing each value (name) and including inside a canned string. 

students.each do |student|
  puts "#{student} is learning how to learn."
end

#For this block, we will be grabbing the string value inside the array and printing (interpolating) and 

