# Intro to OOP

* WHAT IS AN OBJECT!?
* What is OOP?
* What is an Interface?
* What is Encapsulation?
* What is a class?
* What is a class instance?

## Intro to Classes

A basic class:

```
class Student
  def initialize
    puts 'I Live!'
  end
end
```

Instantiating a class:

```
bob = Student.new
puts bob
```

A class with constructor arguments and private instance variables:

```
class Student
  def initialize(name, age=100)
    @name = name
    @age = age
  end
end

bob = Student.new("Bob")
puts bob.name
# nil
```

A class with a public getter method:

```
class Student
  def initialize(name, age=100)
    @name = name
    @age = age
  end
  
  def name
    @name
  end
end

bob = Student.new("Bob")
puts bob.name
# "Bob"

bob.name = "Robert"
# Error
```



A class with public getter and setter methods:

```
class Student
  def initialize(name, age=100)
    @name = name
    @age = age
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name = name
  end
end

bob = Student.new("Bob")
puts bob.name
# "Bob"

bob.name = "Robert"
# "Robert"
```

A class with additional methods & `self` reference:

```
class Student
  def initialize(name, age=100)
    @name = name
    @age = age
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def say_hello
    @age < 18 ? "sup? I'm #{@name}" : "Hello, my name is #{@name}"
  end
  
  def to_s
    self.name
  end
end
```

A class with attr_accessor:

```
class Student
  attr_accessor :name, :age
  
  def initialize(name, age=100)
    @name = name
    @age = age
  end

  def say_hello
    @age < 18 ? "sup? I'm #{@name}" : "Hello, my name is #{@name}"
  end
  
  def to_s
    self.name
  end
end
```
