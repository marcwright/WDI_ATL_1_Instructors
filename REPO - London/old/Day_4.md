
remind about:
- Monday Scrum
- Lunch today
- Beers Friday


# Homework Review | 9:00 - 10:00
- Who's got a working MTA app?
- Go through the working code
- Does anyone need more of a nudge on their code?

# Object Oriented Programming | 10:00 - 11:15
- Pre-frame: "today's going to be a deep-dive further into Ruby. Some of these concepts might seep straight in, and others might take a little longer. That's okay - if anyone gets it all straight away, they can take over my job :-)"

- Define classes
  - Containers of methods
  - description of *things*
  
- Code-along in Pry
  - create new
      class Person
      end
      
      p=Person
      
  - Add a method to the class
      class Person
        def speak
          puts "good morning"
        end
      end
      
      p.speak
      
  - Add another method (with parameters)
      class Person
        def talk(words_to_say)
          puts "I would like to say '#{words_to_say}'"
        end
      end
      
      p.talk("Ruby is cool")

   - aside... A feature of Ruby is that when we define a class again, it merges methods together - existing methods are "overloaded"/overwritten by newer ones.
     - This can be useful... it can also bite us in the bum
   

- Move to text editor
  - touch ./w1d4/oo/ruby_classes.rb
  - implement Person class, with "require 'pry'" and "binding.pry"
  
  - add "set_age(age)" and "get_age" methods - instance variable for @age
    - pry into it
    - show different instances store their own age - instance variables
    - if they're keen/questioning - show why local vars and class-instance vars don't work.
    
  - Ruby conventions - get rid of "set_" and "get_"
  
  - Other conventions
    - ?, ! as method names
    
  - add methods for "sex" and "name"
    
  - initialize with params
    
  - Another Ruby convention:
    :attr_accessor
  
  - overloading methods
    - the console return value isn't very friendly. In the background, Pry/Ruby are calling ".to_s", so let's overload it.
    def to_s
      "uh oh..."
    end
    
    def to_s
      "#{@name} is a @{age} year old #{sex}"
    end

- Class methods
  - what's the purpose?
  - Where have we used them already?
  - Person.breed(parent1, parent2)
  

# Inheritance | 11:30 - 12:00
- What is "Inheritance"?
  - inherited attributes from parents
  - inherited attributes from ancestors... all the way back to the first reproducing cell

- Programming concepts of inheritance 
  - different languages are slightly different
  - Ruby, as you might expect, is quite flexible
  
- Create a Tetrapod class and subclass Person

- Add some methods, and Pry
  - p = Person.new
  - p.class
  - Person.ancestors

- How do real programming applications implement this?
  BlogPost
  PictureBlog < BlogPost
  TextBlog < BlogPost
  
  30-Degrees West example:
    - Auctions have Lots in them
      Lots can be Cars, or Vans, or Boats, or SUVs, ...

# Modules / Mixins | 13:00 - 13:45
- 5min review of some of the concepts from earlier
  - Classes can only inherit from one other class - no such thing as multiple inheritance
    - but can keep on inheriting:
      Tetrapod
      Mammal < Tetrapod
      Ape < Mammal
      Human < Ape

- But what if there's behaviour that not *every* subclass of a superclass implements?
  Does every animal fly? 
  Or any mammal lay eggs?
  
- We could say our model is "composed" of all these different types of behaviour; and some programming languages term this as "composition"

- This type of modular behaviour we would term "mix-in", and we use Modules to mix behaviour into our classes.

- Module is like a class that you can't instanciate.

- Pry
  Person.new.say("Hello") # nope
  Person.include Talkable # nope - error
    - side-bar on private/public/protected
  Person.send(:include, Talkable)
  Person.new.say("Hello") # 'I say: hello'
  
  same as adding:
    "include Talkable" in the code

  Person.ancestors 
    
- If time:
  Comment-out the include, and show extend on an instance
  Show a conditional extend

- Move modules and classes to their own files.
  require/require_relative


# Rental app lab	 | 13:45 - 15:45
As a class, you will be creating an app that models the rental process. The premise is that "Owners of buildings can rent apartments to potential tenants". This app should be created using a code-along style.
* Ask students "What types of objects might you have in an app that manages rentals?"
  * Settle on a list that includes building, person, and apartment
* Ask students "What types of things will each of these do (verbs)? Or what will define them (nouns)? And what type will each be?"


# Review of the concepts of OO | 16:00 - 16:30
- Ask around the class

# Happitails Lab Homework 
- github for requirements


