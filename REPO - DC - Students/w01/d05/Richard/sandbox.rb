

class Student # Capitalized - Object


  def initialize(name, age)
    @name = name
    @age = age
  end

  def name              #getter, allows users to access information
    return @name
  end

  def name=(name)       #setter, allows people to change information
    @name = name
  end

  def age
    return @age
  end

  def do_homework
    return "I'm doing my homework, and loving it."
  end

  def to_s  # defaults output,
    return "Student"
  end

  def say_hello
    if @age <18
      return "Why, Hello! I'm #{@name} it's a pleasure to meet you?"
    else
      return "hello, my name is #{@name}"
    end
  end
end



s1 = Student.new('Bob', 20)
s2 = Student.new('Paul', 16)

puts s1.say_hello


puts s2.say_hello

