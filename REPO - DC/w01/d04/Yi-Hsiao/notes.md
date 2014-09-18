# W01D04 Class Notes #

## Variable Scopes ##

### Local Variables ###
Only accessible from within the block of its initialization
```ruby
i0 = 1
loop {
  i1 = 2
  puts defined?(i0)     # true; "i0" was initialized in the ascendant block
  puts defined?(i1)     # true; "i1" was initialized in this block
  break
}
puts defined?(i0)       # true; "i0 was initialized in this block
puts defined?(i1)       # false; "i1" was initialized in the loop
```

### Class and Instance Variables ###

An **instance** variable begins with a `@`.  It belongs to the object itself.  Uninitialized instance variables have a value of `nil`.

A **class** variable begins with a `@@`.  It is shared by all instances of a class.
```ruby
class Parent
  @@foo = "Parent"
end
class Thing1 < Parent
  @@foo = "Thing1"
end
class Thing2 < Parent
  @@foo = "Thing2"
end
Parent.class_eval("@@foo") #=> "Thing2"
Thing1.class_eval("@@foo") #=> "Thing2"
Thing2.class_eval("@@foo") #=> "Thing2"
```

### Global Variables ###
A global variable begins with a `$`.  It can be accessed from anywhere within the program during runtime.

## Imperative vs. Declarative Programming ##

### Declarative Programming ###
Expresses what the program should accomplish without prescribing how to do it in terms of sequences of actions to be taken.

### Imperative Programming ###
Algorithms are implemented in terms of explicit steps.

For example:
```ruby
list_shows = ['Game of Thrones', 'House of Cards', 'Breaking Bad']

# imperative statement
imperative_result = []
i = 0
while i < list_shows.length do
    show = list_shows[i]
    shows_i_love << "I <3 #{show}"
    i += 1
end

# declarative statement
declarative_result = list_shows.map { |show| "I <3 #{show}" }

# both statements have the same result
declarative_result == imperative_result
=> true
```

## Blocks ##
```ruby
3.times { puts "Hi!" } # puts "Hi!" 3 times

# blocks can have optional parameters to indicate where it is in the loop
3.times { |x| puts "Loop number #{x}" }
#=> Loop number 0
#=> Loop number 1
#=> Loop number 2
```

### Methods Yielding to a Block ###
```ruby
def simpleFunction
  puts "I'm in the method."
  yield
  puts "Back in the method."
  yield
end

simpleFunction { puts "I'm in the block!" }

# Prints:
# I'm in the method.
# I'm in the block!
# Back in the method.
# I'm in the block!
```

## Enumerables ##

Enumerables act as:

### 1. Proxy for each ###
```ruby
src = "abc"
puts src.enum_for(:each_char).map { |b| b * 2 } # prints each character twice on a separate line
```

### 2. Source of values from a block ###
```ruby
block =  Enumerator.new {|g| g.yield 1; g.yield 2; g.yield 3}
block.each { |item| puts item } # prints: 1, 2, 3
```

### 3. External iterator ###
```ruby
block =  Enumerator.new {|g| g.yield 1; g.yield 2; g.yield 3}
puts item while item = block.next  # prints: 1, 2, 3
```

## File I/O ##
```ruby
f = File.new("file_name.ext", "IO_mode")
f.write "some_text"
f.close
```
