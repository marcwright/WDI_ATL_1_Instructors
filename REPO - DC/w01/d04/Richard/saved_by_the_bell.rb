students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]


# We will need to use a method which prints a message to the console:
# some tools inlude: Print and Puts


Puts "The 'student' data structure is an array. An array is a structured datat storaged device that is organized by indices."

# In order to let the users know that someone is learning in our class
# we must be able to go through each item in our array.  Doing so we have # a few iterating functions, or enumerables: .each will interate through # each item in our array, .select will grab an item in the array based on # a condition, or conditions, and .map will grab iterate through the items
# in the array and assign them to a new variable.  For this we'll use .map
# to print the items outs.
#

students.each do |student_name|
  puts "#{student_name} is learning to learn!"
end

