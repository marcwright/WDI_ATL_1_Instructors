class Student

  #takes in parameters below and sets them to instance variables (Bob & 20); CONSTRUCTOR; initialization isn't required but makes it cleaner to call with parameters instead of by method individually
  def initialize(name,age)
    @name = name
    @age = age
  end

  #makes instance variable accessible outside of class (GETTER)
  def name
    return @name
  end

  #this would let other people give an attribute to set name to i.e. change name to Paul (SETTER)
  def name=(name)
    @name = name
  end

  #makes instance variable accessible (BUT NOT CHANGEABLE without getter & setter)
  def age
    return @age
  end

  #would be called if s1.do_homework was below
  def do_homework
    return "I'm doing my homework and loving it!"
  end

  def say_hello
    if @age < 18
      return "sup"
    else
      return "Hello, my name is #{@name}."
    end
  end

end

#parameters with new class automatically go to initialize method; .new creates an instance and then initializes using the parameters
s1 = Student.new("Bob", 20)
s2 = Student.new("Bobby", 16)

puts s1.say_hello
puts s2.say_hello
