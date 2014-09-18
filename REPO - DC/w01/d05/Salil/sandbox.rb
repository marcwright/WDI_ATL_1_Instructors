

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

  def age
    return @age
  end

  def do_homework
    return "I'm doing my homework"
  end

  def say_hello
    if @age < 18
      return "Sup"
    else
      return "Hello, my name is #{@name}"
    end
  end

end


student = Student.new('Salil', 22)
bobby = Student.new("Bobby", 16)

puts student.say_hello
puts bobby.say_hello



