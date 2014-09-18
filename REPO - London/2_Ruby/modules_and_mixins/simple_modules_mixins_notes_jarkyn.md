#MODULES/MIXINS

Classes can only inherit from one other class - no such thing as multiple inheritance
    - but can keep on inheriting:
      Tetrapod
      Mammal < Tetrapod
      Ape < Mammal
      Human < Ape

But what if there's behaviour that not *every* subclass of a superclass implements?
  Does every animal fly? 
  Or any mammal lay eggs?
  
We could say our model is "composed" of all these different types of behaviour; and some programming languages term this as "composition"

This type of modular behaviour we would term "mix-in", and we use Modules to mix behaviour into our classes.

Module is like a class that you can't instanciate.

Lets have a look at the example. 
In terminal lets create modules.rb file: 

```
touch modules.rb
```
open that file in sublime and lets create a Person class

```
class Person

  attr_accessor :age, :sex, :name

  def initialize(age=nil, name=nil)
    @age, @sex, @name = age, name
  end

  def whistle(tune=:aimless)
    case tune
    when :aimless
      puts "whistle whistle whistle"
    else
      puts "whistling #{tune} whistling #{tune}"
    end

  end
end
```

Next we will define our module for moving behaviour:

```
module Moveable
  def walk
    puts "left, right, left, right"
  end
end
```

For Person class to adopt the methods within this module we will add the following line:

```
class Person
  
  include Moveable
  
  ...
  
end
```

Doing this means that we can now use _walk_ method from the Moveable module. 

Let's create another module Drinkable:

```
module Drinkable
  def drink
    puts "i am allowed to drink"
  end
end
```

Now, what if we only wanted to for the functionality of Drinkable module to be included if the instance of the Person class had age value 18 or more?..

We CAN! This is how we include module coditionally within the initialize method:

```
class Person

  ...

  def initialize(age=nil, name=nil)
    @age, @sex, @name = age, name
    extend Drinkable if age.to_i > 17
  end
	
  ...
	
end

```

This allows us to include module based on the information within the instance.
Next we will include _pry_ and run this in terminal to have a look if our modular behaviour works:
at the very top of our file lets 

`require 'pry-byebug'`

and as the last line in the file:

`binding.pry`

Now lets run our modules.rb in terminal

```
ruby modules.rb
```

this will get us into pry and we can now instanciate our Person class and check if extra behaviour is now available:

```
[1] pry(main)> p1 = Person.new(15, "Habib")
=> #<Person:0x007fdeba450448 @age=15, @name="Habib">

[2] pry(main)> p1.walk
left, right, left, right
=> nil
```

so we can definitely use _walk_ method included from the `Moveable`.
Lets check the _drink_ method:

```
[3] pry(main)> p1.drink
NoMethodError: undefined method `drink' for #<Person:0x007fdeba450448 @name="Habib", @age=15>
from (pry):3:in `<main>'
```
as you might have expected this doesn't work because _age_ of our instance of Person is less than 18, lets create another instance of Person class with age greater than 17:

```
[4] pry(main)> p2 = Person.new(21, "Alex")
=> #<Person:0x007fdeba23d138 @age=21, @name="Alex">

[5] pry(main)> p2.drink
i can drink
=> nil

```
and it works!


This is how we use modules. You have, in fact, have been using modules already may be without realising. In pry:

```
[6] pry(main)> Hash.included_modules
=> [Enumerable, PP::ObjectMixin, Kernel]

[7] pry(main)> Array.included_modules
=> [Columnize, Enumerable, PP::ObjectMixin, Kernel]
```
You can see that both Hash and Array include Enumerable module. So all the enumerable functionality that we use in hashes and arrays is coming from this module (http://ruby-doc.org/core-2.1.2/Enumerable.html)


Now that we made our the funcitonality modular, we can also create separate files for the modules and use require_relative to before we include in the class that needs them

