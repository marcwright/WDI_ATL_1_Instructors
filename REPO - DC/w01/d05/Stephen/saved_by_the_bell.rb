# Stephen Stanwood (stephen@stanwoodsolutions.com)

# students is an array of strings
students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

# To see the name of every student, we can use .each because it enables us
# to do something with each student in the class list.
students.each { |s| puts "#{s} is learning to learn." }
puts

# To display each student's position, we can use .each_index, which allows
# us to access each position in the list and, in turn, each student.
students.each_index { |i| puts "#{students[i]} is the student in the #{i} index." }
puts

# The .size method allows us to determine the number of elements in an array,
# so we can use that to figure out the number of students in the class.
puts "There are #{students.size} students in the class!\n\n"

# Array's .index method will tell us where a given student is stored, so we
# can use that to determine the location of a particular name in the list.
puts "'Stephen Stanwood' is in the #{students.index("Stephen Stanwood")} index.\n\n"

# Arrays allow us to retrieve by index using [] (with indicies starting at
# 0), so we can use that to identify the fifth person in the list.
puts "#{students[4]} is the fifth person.\n\n"

# When we need to pick out only some of the students based on certain
# criteria, .select allows us to specify those criteria and filter the list.
puts "Students with 'J' names:\n\n"
puts students.select { |s| s[0].upcase == 'J' }
puts

### SEARCHING FOR A SOUL MATE ###

## (1) ok_cupidites.keys
## (2) ok_cupidites["southwesternDave"][:in_a_relationship]
## (3) ok_cupidites["WOOTman"][:hobbies].push("True Detective")
## (4) ok_cupidites["nicestGuy5530"][:seeking]
## (5) ok_cupidites["southwesternDave"][:hobbies][2]
## (6) You would check each entry, see if that person was single, and include
## them in your resulting list if they are (involves .select method).
