#Classes, Objects, and Inheritance


###Learning Objectives
- Articulate the value of using objects in programming
- Write classes with:
	- Attributes
	- Instance variables
	- Initialize method, and other methods relevant to the object
- Initialize a new class and perform actions on/with it

###Lesson Advice From Last Time
- Start by demonstrating the basic syntax of creating a class, and then building it out
- Discuss the following with students using the whiteboard as necessary, including the importance of each:
	- attributes
	- methods
	- .new and initialization
- Demonstrating class inheritance is a valuable concept as well, including overriding and calling parent functions (super)
	- Using the whiteboard as necessary:
		- What is inheritance?
		- What does a class inherit?
- Demonstrate the difference between a class method and an instance method
- Use Pry to dig into classes, explore methods, and debug
- If time is available, `private` methods

###Build It Out
- Parent class -- Animal 

```
class Animal
  def live  
    puts "I live in a zoo!"      
  end  
end 
```
(then make an ```Animal.new```)

- First child class to inherit from Animal -- Mammal

```
class Mammal < Animal
  def speak  
    puts "I can speak!"  
  end 
end  
```

(then make a ```Mammal.new``` and have it live, speak. try making the Animal speak)

- First child class to inherit from Mammal -- Lion

```
class Lion < Mammal
  def initialize
    @mane = "fuzzy"
  end
  def speak  
    puts "ROAR! I have a #{@mane} mane"  
  end
end 
```

(then make a ```Lion.new``` and make it speak)

- Second child class to inherit from Mammal -- Cow

```
class Cow < Mammal
  def speak  
    puts "Moo."  
  end 
  def chew
  	puts "chomp chomp chomp"
  end
end
```

(then make a ```Cow.new``` and make it speak, chew. try making the Lion chew)


###Student Prompts for "You Do" Work
- Define a Car class.  It should have attributes like max_speed, color, seating_material, etc.
	- Define a few classes for different car makes/models (for example, define a Ferrari class with a high max_speed) 
    - These classes should inherit from the Car class and have their own special attributes/methods
	- Instantiate several different objects from these classes and show off what they can do
- Define a Food class.  It should have attributes like flavor, texture, is_healthy etc.
	- Define a few classes for different types of food (for example, define a Burger class with is_healthy set to false) 
    - These classes should inherit from the Food class and have their own special attributes/methods
	- Instantiate several different objects from these classes and show off what they can do





###Potential questions, difficulties, and problems
- The overall concept of an object as a singular entity
- Inheritance and what carries through; overriding parent methods
- Scoping

###Why Objects and Classes?
- Classes are a critical component of OOP, and OOP is a fundamental component of building larger apps, particularly in rails.
