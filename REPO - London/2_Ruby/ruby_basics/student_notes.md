# Ruby Basics | Identify key aspects of the Ruby language

## Ruby basics - What is Ruby

We're going to go over the basics of the Ruby programming language, and try lots of combinations of functionality as we can to increase our skills.


### What is Ruby

Created in 1995 by Yukihiro Matsumoto - "I hope to see Ruby help every programmer in the world to be productive, and to enjoy programming, and to be happy. That is the primary purpose of Ruby language."

It's an interpreted scripting language.

- What do we use programming languages for?
- Why should we use one over the other?


## Working with Ruby

`irb` will open an Interactive Ruby environment in the console (we exit it by typing `quit` or `exit`).

'irb' stands for interactive ruby, and typing that into a terminal launches a ruby REPL.  

  * REPL = Read, eval, print, loop => good for experimenting with short snippets of code.

irb allows to quickly try snippets of ruby outside of your application.


## Objects Overview

Everything in Ruby is an "object", and objects have a "type"

We'll cover OO programming in depth later, but for now, if we want to know what Ruby thinks something is, we can ask it with the method `.class`

```
  1.class
  "1".class
  1.0.class # or "(1.0).class" - disambiguation
```

To prove everything is an object, you can call the method `.object_id`.


## Data Types

  * What is a number?
      * ints and floats
  * What is a string?
  * Booleans


## Variables

We can store values in "variables" - they're variable because the values can change (we also call this 'mutability')

### Types of variables

`variable` => local variable  
`@variable` => instance variable  
`@@variable` => class variable  
`$variable `=> global variable   
`VARIABLE` => constant variable (funny name!)

For now, we will mainly be using local and instance variables. We'll never use global variables - until we know why.


### Naming conventions

We use **CamelCaseForClasses**, **UPPER_CASE_SNAKE_CASE_FOR_CONSTANTS**, and **lower_case_snake_case_for_everything_else**.


## RubyGems

RubyGems is a package manager for the Ruby programming language that provides a standard format for distributing Ruby programs and libraries. Simply put, it manages the installation of "gems" (ruby libraries).

To see what gems you have installed:  

`gem list`

To install a new gem:  

`gem install some_gem_name`

For example: 

```
  gem install rainbow
  Fetching: rainbow-2.0.0.gem (100%)   
  => Successfully installed rainbow-2.0.0
```

Back in irb:
  
```
  require "rainbow/ext/string"
  string = "hello world"
  print string.color(:red)
  # or
  print Rainbow(string).red
```

[Rainbow Gem Github](https://github.com/sickill/rainbow)


## Ruby Basics in IRB

Code along in IRB

```
  x = 1
  x
  x.class
  x + 1
  x
  x += 1
```

other operators... `/ * - ** %`


### Duck typing

```
  10 / 2
  5 / 2
```

??? What?! Why is it "2"?!! Can't Ruby do maths?! We found a bug!

Nope... the answer is to do the following:

```
  5 / 2.0
```

This is called "Type Coercion" - Ruby figures out what we want to do. Also known as "Duck Typing"


#### Can we duck type strings?

```
  "5" / 2.0
  "5".to_i
  "5".to_i / 2.0
```

Sometimes unexpected results

```
  "Hello".to_i
  "4vid".to_i
```

What answer do I want? How can the computer (or Ruby) know?

  - `"5" + 5` # do I want "55" or "10"?
  - How to get "10"? `"5".to_i + 5`
  - How to get "55"? `"5" + 5.to_s`
  - This is called "String Concatenation"


## Equality, evaluation, boolean

### Equality

We've said that Ruby knows the type of objects, but will coerce them for us if it can, but how do we tell if two objects are the same, different, bigger, smaller?

```
  a = "hello"
  b = "hello"
  a == b
  a != "world"
  1 > 2
  2 < 1
  1 >= 1
```

### Evaluating Strings

```
  "a" > "b"
  "b" > "a"
  "a" > "A" # Capital 'A' comes before lower-case 'a' in the character-set - so is 'smaller'
```

### Booleans

Booleans are whether something is true or false. But since everything in Ruby is an object - true and false are instances of object too:

- `true.class` is TrueClass  
- `false.class` is FalseClass  

We frequently use "boolean logic":  

- `||` - or  
- `&&` - and

```
  true || false
  false || true
  false && true
  true && true
  nil && true
  !true
  !false
  x = "hello"
  !x
  x && true
  x = nil
  !x
  x && true
```

[truth tables](http://memorize.com/ruby-truth-tables/hezwx)     

