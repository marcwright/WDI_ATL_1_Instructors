# Object Oriented Programming

###Intro to OOP

Just like in real life, **everything** in Object-Oriented-Programming (OOP) is an object, and methods are how these objects interact with each other. 

Objects have methods and properties, much like in real life (a pen, for example, will have a "write" method, and an "ink" property). 

In Ruby, we have **classes** (which are also objects). A class is used to specify the form of an object and it combines data representation and methods for manipulating that data into one easy-to-interact-with package. To put it simply: an object is a bunch of methods and properties encapsulated within a class; a class is a block containing some code.

The data and methods within a class are called **members** of the class. Hash, Array, String,... they are all classes. Think of a class as a blueprint from which we create **instances**. The instances will be identical, but separate objects. 

We have different types of methods for our classes (class methods) and for our instances (instance methods).

###Creating your own class

To define a class, we use the keyword "class" followed by the class name "ClassName" (class names that contain more than one word are written using the CamelCase convention). We will close a class with an "end", at the end of the file. 
Example:

Let us define a Person class:

```
class Person 
 def talk(words)
   puts "I say, #{words}"
 end
end

bob = Person.new
```  


Then we can check what type of object Bob is:  
```
bob.class
=> Person
```

We can call the `.talk()` method which we defined in the Person class. This is an instance method. We are calling it on the instance:  

```
bob.talk("hello")
=> "I say, hello"
```

Lets reopen our Person class and add a familiar method.

```
class Person 
 def to_s 
   "My object id is: #{object_id}"
 end
end

bob = Person.new
fred = Person.new
bob.to_s
=> "My object id is: 226765960"
fred.to_s
=> "My object id is: 227583904"
```

Notice they have different IDs. This illustrates that although they are from the same class, they are separate instances of this class.



###Getters and Setters

####Instance variables:

The instance variables are akin to class attributes, and they become properties of objects once new objects are created using the class. Object attributes are assigned individually and aren't shared with other objects. They are accessed using the @ operator within the class. However, to access them outside of the class, we use "public" methods, which are called **accessor methods**.

####Accessor, setter & getter methods:

To make the variables available outside the class, they must be defined within "accessor" methods. These accessor methods are also known as **getter methods**. 

To illustrate this, lets define a more complex class. It will have an "age" instance variable which we can set (setter) and then read (getter).

Example:

```
class Person  
  def speak 
    puts "good morning from a #{@age} year old"
  end

  def talk(words_to_say)
    puts "I say, #{words_to_say}"
  end
  
  def age=(value)
    @age = value
  end
  
  def age
    @age
  end
end
```

Now, outside of the class:  

```
bob = Person.new
bob.speak
=> "good morning from a  year old"
bob.age
=> nil
bob.age = 21
bob.speak
=> "good morning from a 21 year old"
bob.age
=> 21
```

Fortunately, Ruby gives us a simpler way of achieving this, by using "attr_writer", "attr_reader" and "attr_accessor". We are building an "attr_..." with a **:symbol** (or several, separated by commas, if you want to have access to several elements) - never with a string or a number.

Example:

```
Class Person  
  attr_reader :age
  attr_writer :age

  def speak
    puts "I say, #{words_to_say}"
  end

end
```

Now, outside of the class:

```
alice = Person.new
alice.age = 18
alice.age
=> 18
```

A faster way to set your attribute to be both readable and writable it to use "attr_accessor":

```
class Person  
  attr_accessor :age, :sex

  def talk(say_what)
    puts "just said '#{say_what}'"
  end

end
```

Now, outside of the class:

```
alice = Person.new
alice.age = 18
alice.age
=> 18
```


###Initializers

When creating an instance of a class, we can also pass arguments to the `.new` method, and handle these arguments on the class side. That's where the "initialize" method comes in handy.

The "initialize" method is a standard Ruby class method. It is very useful when initializing class variables at the time of the creation of the object. This method may take a list of parameters, and like any other Ruby method.

Example:

```
  def initialize(first_name, last_name, age)
     @first_name = first_name
     @last_name = last_name
     @age = age
  end
```

To illustrate this concept, let's rewrite the Person class with an initializer so we can set the age at the time of the creation of the instance. We do this using an options hash.

```
class Person  
  attr_reader :age, :name

  def initialize(options={})
    @age = options[:age]
    @name = options[:name]
  end
end 
```

```
fred = Person.new(age: 25)
fred.age
=> 25
```


###Class variables

**Class variables** are variables which are shared between all instances of a class. Class variables are prefixed with two @ characters (@@). A class variable must be initialized within the class definition.

So far we have been building instance variables. Let's look at an example of class variable:

```
class Person  
  @@toe_count = 10

  def initialize(options={})
    @age = options[:age]
  end
  
  def age
    @age
  end
  
  def toe_count
    @@toe_count
  end
  
  def toe_count=(value)
    @@toe_count = value
  end
end 
```

```
fred = Person.new
wilma = Person.new
fred.toe_count
=> 10
wilma.toe_count
=> 10
fred.toe_count = 9
fred.toe_count
=> 9
wilma.toe_count
=> 9
```

###Class methods

A **class method** is defined using the keyword "def" followed by "self.methodname()". As you can see, to define a class method, we precede our method with "self".  We close it with the "end" delimiter and write its class name as "classname.methodname".

Example:

```
class Person

  def self.breed(person1, person2)
    child = Person.new

    child.name = [person1, person2].sample.name
    child.age = [person1, person2].sample.age

    child
  end
end 

p1 = Person.new name: 'Michael', age: 42
p2 = Person.new name: 'Katherine', age: 31

Person.breed(p1, p2)
```


###Class Constants

You can define a **constant** inside a class and assign it a direct numeric or string value. It is defined without using @ or @@. By convention, we write the name of class constants in all-caps.

```
class Hacker
  LANGUAGE = "Ruby"
end

Hacker::LANGUAGE
=> "Ruby"
```

