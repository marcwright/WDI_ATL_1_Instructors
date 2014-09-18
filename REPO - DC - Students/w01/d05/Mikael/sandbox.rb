class Student
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
  end

  def do_homework
    return "I'm doing my homework and loving it."
  end

  def to_s
    return "Student"
  end

  def say_hello
    if @age < 18
      return "Why hello, I'm #{@name}, it's a pleasure to meet you!"
    else
      return "Hello, my name is #{@name}"
    end
  end

end

s1 = Student.new("Bob", 20)
s2 = Student.new("Johnny", 16)

puts s1.name

s1.name = "Paul"
puts s1.name
puts s1.say_hello
puts s2.say_hello
