 
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
    return "I'm doing my homework and loving it!"
  end

  def say_hello
    if @age < 18
      return "Why hello, I'm #{@name}, its a pleasure to meet you"
    else
      return "Hello, my name is #{@name}"
    end
  end

 end

s1 = Student.new('Bob', 20)
s2 = Student.new('Bobby', 16)

puts s1.say_hello()
puts s2.say_hello()



