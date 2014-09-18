# Advanced OOP Concepts

* What is Abstraction?
* What is Inheritance?
* What is "self" and "super"?
* How do we use Public, Private, and Protected?
* Touch on `.class` and `.object_id`

## Vocabulary

* **class**: an object blueprint
* **instance**: a constructed class instance
* **sub-class**: a class derived through inheritance.
* **extends**: a class is "extended" into a sub-class.
* **self**: an instance's way of refering to itself.
* **super**: a sub-class' way of refering to its parent class.
* **public**: methods available outside of the class.
* **private**: methods available only within the class.
* **protected**: methods available to only the class and its descendents.


## Inheritance

An abstract base class can be extended into many specific "sub-class" implementations. Sub-classes can also be used as abstracts for further extension.

Notice the use of "**super**" in each sub-class. This keyword calls up to the ancestry tree to run the super-class methodology.

```
# Animal (abstract)
class Animal
  def initialize
    @brain = true
    @legs = 0
  end
  
  def has_brain?
     return @brain
  end
  
  def leg_count
    return @legs
  end
end


# Human (extends Animal)
class Human < Animal
  def initialize
    super
    @legs = 2
  end
end


# Pet (extends Animal)
class Pet < Animal
  def initialize
    super
    @legs = 4
    @fleas = 0
  end

  def flea_count
    return @fleas
  end
end


# Dog (extends Pet)
class Dog < Pet
  def initialize
    super
    @fleas = 8
  end
end


# Cat (extends Pet)
class Cat < Pet
  def initialize
    super
    @fleas = 4
  end
end
```

## self

Use the keyword "self" within a class to refer to the constructed object instance.

```
class CoffeeMaker
  def initialize
    @water_level = 0
    @cartridge = nil
  end
  
  def has_water?
    return @water_level > 0.25
  end
  
  def has_cartridge?
    return !@cartridge.nil?
  end
  
  def brew
    if self.has_water? && self.has_cartridge?
      puts 'Start brewing!'
    end
  end
end

pot = CoffeeMaker.new
puts pot.brew
```

## Public, Private & Protected

- **Public** class methods are known to all objects within the application.

- **Private** class methods are known only to the class itself. Attempting to reference private methods from outside of the class will result in an error.

- **Protected** class methods are known only to the class and its descendent classes. Attempting to reference protected methods from outside of the class' inheritance tree will result in an error.

Methods not needed outside of the classes implementation should be made hidden using private or protected. As a general rule, you should make hidden methods private unless they're specifically intended for inheritance schemes

```
# Robot (abstract)
class Robot
  def initialize
    @name = 'Marvin'
  end

  def speak
    return get_speaking_quote(get_random_index)
  end

  protected
  
  def get_speaking_quote(index)
    return "Hello .. I am .. #{@name}"
  end

  private

  def get_random_index
    return Random.new.rand(3)
  end
end


# Protocol Droid (extends Robot)
class ProtocolDroid < Robot
  def initialize
    @name = 'C3PO'
  end

  protected

  def get_speaking_quote(index)
    case index
    when 1
      return "Oh, my! What have you done? I'm BACKWARDS. You flea-bitten furball!"
    when 2
      return "Sir, it's quite possible this asteroid is not entirely stable."
    else
      return "Noisy brute. Why don't we just go to lightspeed?"
    end
  end
end


# Bender (extends Robot)
class Bender < Robot
  def initialize
    @name = 'Bender'
  end
  
  protected

  def get_speaking_quote(index)
    case index
    when 1
      return "Aw, I just made myself feel bad."
    when 2
      return "Stupid can opener! You killed my father, and now you've come back for me!"
    else
      return "Bite my shiny metal butt."
    end
  end
end

robo = Robot.new
puts robo.speak

c3po = ProtocolDroid.new
puts c3po.speak

bender = Bender.new
puts bender.speak
```