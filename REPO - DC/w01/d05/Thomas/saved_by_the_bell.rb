students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

##students is an array of strings
##to print each name interpolated into a string, I will use the .each method to iterate over every value in students.  At each stop, my codeblock will execute to accomplish said goal, return a value, and move on to the next value until reaching the end.

# students.each do |name|
# 	print "#{name} is learning to learn."
# end

##this next bit will build upon the first challenge.  To print each student's index value, I will need to access these values with .each_index method.  I will need to feed two block arguments to my block to accomplish this.

# students.each_with_index do |name, index|
#     print "#{name} is the #{index} index."
# end

##printing the number of students in the class will be accomplished using the array.length method.  This method will return the total number of values stored within an array.

# puts students.length

##this will be accomplished by feeding the index method an object value
# puts students.index("Stephen Stanwood")

##this will be accomplished by passing the array an index value to print its corresponding object value
# puts students[4]


students.select do |name|
	print name("J")
end