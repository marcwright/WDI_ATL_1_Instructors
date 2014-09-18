# W02D01 Class Notes #

## Require Relative ##
```ruby
require_relative "folder_name/ruby_filename"  #runs code in this ruby file
```

## Abstractions ##
Abstraction involves the facility to define objects that represent abstract "actors" that can perform work, report on and change their state, and "communicate" with other objects in the system.

## Inheritance ##
Inheritance is when an object or class is based on another object or class, using the same implementation; it is a mechanism for code reuse.

Composition vs. Inheritance: 
http://en.wikipedia.org/wiki/Composition_over_inheritance

```ruby
class Animal
  attr_reader :legs
  def initialize
    @brain = true
    @legs = 0
  end
end

class Human < Animal
  def initialize
    super      # @brain = true; @legs = 0
    @legs = 2  # @legs = 2
  end
end
```

### Public, Private, Protected Methods ###
By default, all methods in Ruby classes are public - accessible by anyone. There are, nonetheless, only two exceptions for this rule: the global methods defined under the Object class, and the initialize method for any class. Both of them are implicitly private.

There are two ways to make a private or protected method:

Without an argument:
```ruby
class Example
  private
  def private_method; end
  def another_private_method;end

  protected
  def protected_method;end
  def another_protected_method;end
end
```

Making instance methods private with an argument:
```ruby
class Example
  def private_method;end
  def public_method;end
  private :private_method
end
```

You can make class methods private with `private_class_method`.  A common use case is making `.new` private and requiring a getter to create the instance.
```ruby
class SingletonLike
  private_class_method :new

  def SingletonLike.create(*args, &block)
    @@inst = new(*args, &block) unless @@inst
    return @@inst
  end
end
```
