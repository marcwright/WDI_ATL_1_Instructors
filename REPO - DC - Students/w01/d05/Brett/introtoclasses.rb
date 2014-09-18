class Student

# @ symbol means private, it's encapsulated
# initialze the instance of the class
  def initialize(name, age)
    @name = name
    @age = age
  end

# public interface
# release name from the instance
# "getter"
  def name
    return @name
  end

# setter
# allows input
  def name=(name)
    @name = name
  end

  def age
    return @age
  end

  def do_homework
    return "I'm doing my homework and loving it!"
  end

def say_hello
  if @age < 18
    return "sup?"
  else
    return "Hello, my name is #{name}"
  end
end

end

# .new creates the instance and calls "initialize" in the class
s1 = Student.new("Bob", 20)
s2 = Student.new("Bobby", 16)

puts s1.say_hello()
puts s2.say_hello()
