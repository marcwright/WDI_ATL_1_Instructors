# ### Saved By The Bell: The Newest Class
# - Create a file called saved_by_the_bell.rb
# - Begin with this simple data structure representing your class:
# ```
students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]
# ```
# - Write a program that:
#   - beings with a comment identifying what type of data structure `students` is.
#   - prints `"STUDENT_NAME is learning to learn."` for every student in the class
    students.each { |student_name| puts "#{student_name} is learning to learn." }
    puts
#   - prints `"STUDENT_NAME is the student in the STUDENTS_INDEX_VALUE index"` for every student in the class
    students.each_with_index do |name, index|
      ordinal_suffix = case index
        when 1 then "st"
        when 2 then "nd"
        when 3 then "rd"
        else "th"
      end
      puts "#{name} is the student in the #{index}#{ordinal_suffix} index."
    end
    puts
#     - What tool will you use? If you don't know, where will you look?
#   - Finds and prints the number of students in the class
    puts "There are #{students.length} students in the class.", ""
#     - What tool will you use? Again, if you don't know, where will you look?
#   - Finds and prints the index of `"Stephen Stanwood"`
    puts "Stephen Stanwood is in index #{students.index "Stephen Stanwood"} of the array.", ""
#   - Prints the fifth person
    puts "#{students[4]} is the 5th person in the array.", ""
#   - Prints all of the students with J names (Jacob, Jon, and Joella)
    puts "All the students with J names:"
    puts students.select { |name| name[0] == "J" }
