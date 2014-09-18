students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]


# We will need to use a method which prints a message to the console:
# some tools inlude: Print and Puts


puts "The 'student' data structure is an array. An array is a structured datat storaged device that is organized by indices."

# In order to let the users know that someone is learning in our class
# we must be able to go through each item in our array.  Doing so we have # a few iterating functions, or enumerables: .each will interate through # each item in our array, .select will grab an item in the array based on # a condition, or conditions, and .map will grab iterate through the items
# in the array and assign them to a new variable.  For this we'll use .map
# to print the items outs.
#

students.each do |student_name|
  puts "#{student_name} is learning to learn!"
end

# In order to access the index we can use the .index method on the
# 'students array for the individual student place within the array which # will the show us the index for the value of the assigned student.

students.each do |student_name|
  puts "#{student_name} is the student in the #{students.index(student_name)} index!"
end


# In order to puts the number of students within our collection of
# students in the array, we can do it a number of ways.  The way that
# we'll perform it is by using the .length method.  This method will
# count each individual value in the array and return the total value.
# Using this we can count how many students there are.
#

puts "There are #{students.length} students in our class!"


# Finding an item in an array is a bit different. We'll want to move to a
# more specific enumerator: .select.  .select will iterate through our
# array and return a value based on a parameter.  This case is "Stephen
# Stanwood."  We'll set our parameter to match "Stephen Stanwood" and only
# return the value that includes it in the Array.

j_names = []
students.select do |student_name|

  if student_name == 'Stephen Stanwood'
    puts "#{student_name} is in index #{students.index(student_name)}"
  end
  if students.index(student_name) == 5
    puts "#{student_name} is in index 5!"
  end
  if student_name.downcase.include? 'j'
    j_names.push(student_name)
  end

end
print j_names


ok_cupidites = {
      "nicestGuy5530" => {
        :name => "Brad Ladd",
        :in_a_relationship => false,
        :hobbies => ["working out", "seeing concerts", "watching sports", "eating"],
        :seeking => ["friendship", "short-term dating", "a long-term relationship", "anything I can get"]
      },
      "southwesternDave" => {
        :name => "Dave Tacoma",
        :in_a_relationship => false,
        :hobbies => ["bird watching", "cross-country skiing", "When I'm bored I do this thing I call 'friendly' prank calls, where I just call strangers and kinda ask them how they're doing and stuff, in a friendly way"],
        :seeking => ["a long-term relationship", "short-term dating"]
      },
      "WOOTman" => {
        :name => "Jeff Lamplugh",
        :in_a_relationship => true,
        :hobbies => ['improvisational comedy', 'aquacizing', 'private investigation'],
        :seeking => []
      }
    }


#1. Use pry to return an array of keys for the `ok_cupidites` hash.
######      array_ok_cupid = ok_cupidites.keys

# 2. Use pry to return whether `southwesternDave` is in a relationship.
######    ok_cupidites["southwesternDave"][:in_a_relationship] =>false

# 3. Use pry to add `watching True Detective` to `WOOTman`'s hobbies.
######   ok_cupidites["WOOTman"][:hobbies].push("watching True Detective")

#4. Use pry to return all the things that `nicestGuy5530` is seeking.
######     ok_cupidites["nicestGuy5530"][:seeking]

#5. Use pry to retrieve `southwesternDave`'s third hobby.
######      ok_cupidites["southwesternDave"][:hobbies][2]
#6. In English, explain how would you return an array of only the ok_cupities that are single?
######
