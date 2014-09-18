# WDI Notes - W1D2 #

## Comments ##

#### Single-line comments ####
```ruby
# this line does nothing; 
print "Hello" # this line prints "Hello"
```

#### Multi-line comments ####
```
=begin
Everything between a line beginning with `=begin' down to
one beginning with `=end' will be skipped by the interpreter.
These reserved words must begin in column 1.
=end
```

## Ruby styling conventions ##

### Naming Conventions ###
- **snake_case**: variables, methods
- **SCREAMING_SNAKE_CASE**: constants
- **CamelCase**: classes
- **headlessCamelCase**: JavaScript variables
- **method?** - returns true/false
- **method!** - destructive re-assignment, returns nil if no change is made

## Memory Management ##

- Memory_management: http://en.wikipedia.org/wiki/Memory_management
- Automatic memory management
- Garbage collection: http://en.wikipedia.org/wiki/Garbage_collection_(computer_science)

### Assignment by Reference vs. Value ###
http://en.wikipedia.org/wiki/Assignment_(computer_science)

## Control Structures ##
http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Control_Structures

### Loops ###

#### While, Unless ####
```ruby
while expression
  #<...code block...>
end
```

```ruby
until expression
  #<...code block...>
end
```

```ruby
line = readline.chomp while line != "what I'm looking for"
```

### Conditionals ###

#### If, Until, If/Elsif/Else Expressions ####

**If**:
```ruby
a = 5
a = 7 if a == 4
print a # prints 5 since the if-block isn't executed
```

**Until**:
```ruby
a = 5
a = 7 unless a == 4
print a # prints 7 since the unless-block is executed
```

**If/Elsif/Else**
```ruby
if expression
  #...code block...
elsif another expression
  #...code block...
elsif another expression
  #...code block...
else
  #...code block...
end
```

#### Ternary Operators ####
```ruby
result = (condition) ? (expression-if-true) : (expression-if-false)
```

#### Conditional Assignments ####
```ruby
result = (value_1 if condition_1) || (value_2 if condition_2)
```

#### Case Expressions ####
```ruby
case a
when 0..4 then puts "#{a} is less than 5"    
when 5 then puts "#{a} equals 5" 
when 5..10 then puts "#{a} is greater than 5" 
else puts "unexpected value #{a} "         # Just in case "a" is bigger than 10 or negative.
end
```

## Methods ##
http://en.wikibooks.org/wiki/Ruby_Programming/Writing_methods

## DRY ##
http://en.wikipedia.org/wiki/Don%27t_repeat_yourself

## Gem ##
http://en.wikibooks.org/wiki/Ruby_Programming/RubyGems

## Breakpoint ##
http://en.wikipedia.org/wiki/Breakpoint
```ruby
require "pry"
binding.pry  # inserts breakpoint
```
