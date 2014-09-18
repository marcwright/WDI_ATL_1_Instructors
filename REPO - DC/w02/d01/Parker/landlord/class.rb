class Student
  # Setter method for @first_name
  def first_name=(value)
    @first_name = value
  end
  # Getter method for @first_name
  def first_name
    @first_name
  end
  # Setter method for @last_name
  def last_name=(value)
    @last_name = value
  end
  # Getter method for @last_name
  def last_name
    @last_name
  end
  # Returns full name
  def full_name
    last_name + ", " + first_name
  end
end

# Take the Class, and turn it into a real Object instance
@student = Student.new
@student.first_name = "Bob"
@student.last_name = "Jones"
puts @student.full_name

class Student
  attr_accessor :first_name, :last_name, :id_number
  
  def full_name
    last_name + ", " + first_name
  end 
end


class Team
  attr_accessor :name, :students
  def initialize(name)
    @name = name
    @students = []
end
  def add_student(id_number, first_name, last_name)
    student = Student.new
    student.id_number  = id_number
    student.first_name = first_name
    student.last_name  = last_name
    @students << student
  end
  def print_students
    @students.each do |student|
      puts student.full_name
    end
  end 
end

You’ve added something new to this class: the initialize method. Now, when you call new, you can pass in the name. For example, you can type Team.new('baseball'), and the initialize method is called. Not only does initialize set up the name, but it also sets up an instance variable named @students and turns it into an empty array. The method add_students fills the array with new Student objects.
Let’s see how you use this class:

team = Team.new("Rowing")
team.add_student(1982, "John", "Smith")
team.add_student(1984, "Bob", "Jones")
team.print_students
