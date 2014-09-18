# W01D05 Class Notes #

## Programming Paradigms ##

- **Imperative**: Defines computation as statements that change a program state
- **Procedural**: Specifies the steps the program must take to reach the desired state
- **Declarative**: Defines computation logic without defining its control flow.
- **Functional**: Treats computation as the evaluation of mathematical functions and avoids state and mutable data
- **Object-oriented**: Organizes programs as objects: data structures consisting of datafields and methods together with their interactions

### Object-oriented programming ###

OOP is an approach to designing modular, reusable software systems.  Rather than structure programs as code and data, an OO system integrates the two using an object:

- Object state (*data*)
- Object behavior (*code*)

OOP enforces separation of concerns, a design principle for separating a computer program into distinct sections, such that each section addresses a separate concern.

## Class & Instances ##
Classes are the basic template from which object instances are created.  Each instance is an object with variables representing its internal state (data) and behaviors that operate on that state (code).

### Instance Variables ###
```ruby
class MyClass
  @one = 1
  def do_something; @one = 2; end
  def output; puts @one; end
end
instance = MyClass.new
instance.output #=> prints nil, because @one is scoped to the object
instance.do_something
instance.output #=> prints 2
```

### Class Variables ###
Class variables are shared across all the class instances.
```ruby
class MyClass
  @@value = 1
  def add_one; @@value= @@value + 1; end
  def value; @@value; end
end
instanceOne = MyClass.new
instanceTwo = MyClass.new
puts instanceOne.value #=> prints 1
instanceOne.add_one
puts instanceOne.value #=> prints 2
puts instanceTwo.value #=> prints 2
```

### Accessor Methods ###
To access class or instance variables, you need to use accessor methods.
```ruby
class MyClass
  attr_accessor :foo # same as attr_reader :foo; attr_writer :foo
  def initialize
    @foo = 28
  end
end
instance = MyClass.new
puts instance.foo #=> prints 28
instance.foo = 496
puts instance.foo #=> prints 496
```

### Class Instance Variables ###
```ruby
class Employee
  class << self; attr_accessor :instances; end # class instance variable
  def store
    self.class.instances ||= []
    self.class.instances << self
  end
  def initialize name
    @name = name
  end
end
class Overhead < Employee; end
class Programmer < Employee; end
Overhead.new('Martin').store
Overhead.new('Roy').store
Programmer.new('Erik').store
puts Overhead.instances.size    # => 2
puts Programmer.instances.size  # => 1
```

### Class Methods ###
```ruby
class MyClass
  def self.some_method; puts 'something'; end
end
MyClass.some_method # prints something; can be accessed without an instance
```

### Instantiation ###

```ruby
class MyClass
  attr_accessor :param
  def initialize(param); @param = param; end
end
my_object = MyClass.new "foobar"
my_object.param #=> 'foobar'
```
