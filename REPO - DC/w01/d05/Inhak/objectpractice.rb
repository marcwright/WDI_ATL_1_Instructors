class Student
  def initialize(name, age)
    #instantial data
    @name = name
    @age = age
  end

  #exposes its private name
  #read only method a "getter"
  def name
    return @name
  end

  #setter method! changed the instance only variable
  def name=(name)
    @name = name
  end

  def age
    return @age
  end

  def say_hello
    if @age < 18
      return "sup"
    else
      return "Hello, my name is #{@name}"
    end
  end
end

s1 = Student.new('Bob', 20)
s2 = Student.new('bobby', 16)

puts s1.say_hello
puts s2.say_hello

s1.name = "paul"
puts s1.name
