# ## Name Input

# Collect a list of student names… the only catch is, we don't know how many we'll have! Create a file called `name_input.rb` and do the following:

# * Write a program that prompts:
#   * **"{n} so far. Enter a student name, or type 'done'"**
# * Collect all names into an array.
# * When *"done"* is entered, break the loop and print:
#   * **"You collected {n} student names."**
#   * **"The names are: {name1, name2, name3, …}"**

class StudentDirectory
  def initialize
    @directory = []
  end

  def get_student_count
    @directory.length
  end

  def print_student_count
    puts "We have #{get_student_count} students in the directory."
  end

  def exit_dir
    puts "Thanks for filling out our student directory."
    print_student_count
    @directory
  end

  def start_dir
    kill_word = "done"  #stops program

    while true
      print_student_count
      puts "Add a student name to our directory, or type 'done':"
      user_input = gets.chomp
      puts
      return exit_dir if user_input == kill_word
      @directory << user_input
    end
  end
end

my_directory = StudentDirectory.new
my_directory.start_dir
