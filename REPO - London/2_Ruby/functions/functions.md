# Methods/Functions | Use methods to make code more efficient

## What are methods? How are they different to functions?

The words 'method' and 'function' are often used interchangably.

  - A 'function' is a chunk of code that can be called by name
  - A 'method' is a function associated with an object


## So what do they do?
  - We use them to encapsulate meaningful pieces of code into small, isolated constructs
  - We've been using them already... ".to_i", ".chomp"
  - In Ruby, they *always* return a value - whether we want it or not
    - By default, the result of the last evaluated expression is returned, but you can also use the `return` keyword to explicitly return

  - Defined with "def" then method name, end with "end"
    - name can't begin with a number
    - lower-case 
    - special characters are allowed and imply functionality (? for predicate, ! or 'bang', = for setters, etc)


## First functions

Look at the loop.rb file that asks users to guess the answer for 2**4:

```
  # loop.rb
  puts "what is 2 to the 4th power?"
  value = gets.chomp.to_i

  while value != 2**4
    print "nope... try again"
    value = gets.chomp.to_i
  end

  puts "yes!"
```

There is duplication in there... twice, we do a `gets.chomp.to_i` - so DRY that up to be a function

```
  # loop.rb
  def get_value
    # put me in first, because Ruby is interpreted...
    gets.chomp.to_i
  end

  puts "what is 2 to the 4th power?"
  value = get_value

  while value != 2**4
    print "nope... try again"
    value = get_value
  end

  puts "yes!"
```

You can also abstract functionality that might 'make sense' to live in its own function:

```
  # loop.rb
  def get_value
    # put me in first, because Ruby is interpreted...
    gets.chomp.to_i
  end

  def warn_user
    print "nope... try again"
  end

  puts "what is 2 to the 4th power?"
  value = get_value

  while value != 2**4
    warn_user
    value = get_value
  end

  puts "yes!"
```


## Be DRY

DRY - is a guiding principle of coding (especially in Ruby)
Don't Repeat Yourself


## Parameters

Parameters (also called 'arguments') are variables passed to a method

```
  def greet(name)
    puts "hello, #{name}"
  end
```

Parameters can be specified to be optional:

```
  def greet(name="you") ...
```

Multiple parameters are separated with a comma:

```
  def greet(first_name, last_name) ...
```

If we want to pass a variable amount of parameters, we can use a 'splat' operator to capture all the given parameters as a single array:

```
  def greet(*names)
    puts "hello, #{names.join(', ')}"
  end

  greet 'Barney', 'Wilma', 'Fred', 'Betty'
```
