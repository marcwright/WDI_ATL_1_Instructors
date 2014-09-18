# WDI Notes - W1D1 #

## Programing Language ##
Programming langague is an artificial language designed to communicate instructions to a machine.

### Low vs. High-Level Languages ###
Programming languages can be categorized by their level of abstraction.  Abstraction is a way of hiding the details of how a machine functions.

* High-level languages have a **strong** abstraction
* Low-level langauges have **little to no** abstraction

For example, we have to write obfuscated code to calculate a Fibonnaci number in a low-level language:
```
8B542408 83FA0077 06B80000 0000C383
FA027706 B8010000 00C353BB 01000000
B9010000 008D0419 83FA0376 078BD98B
C84AEBF1 5BC3
```

In a high-level language, we can write human-readable code that does the same thing:
```ruby
def fib n
  return n if (0..1).include? n
  fib(n-1) + fib(n-2)
end
```

Abstracting does penalize application performance. However, the penalty is usually negligible for most applications running on modern machines.

## Client-Server Model ##
This model is how most web-based services work, like the World Wide Web and e-mail.

It consists of three major components:
* **Client** - accesses services made available by a server
* **Server** - responds to requests across a computer network
* **Computer network** - a telecommunications network that allows computers to exchange data

### Front End ###
Technologies used to execute web programs on the client-side:

* Web browser - Google Chrome, Firefox, Internet Explorer (IE)
* Client-side scripting - HTML, CSS, JS

### Back End ###
Technologies used to handle a client's request before the server responds to it:

* Web server - Heroku, Apache, Nginx
* Server-side scripting - Ruby, Python, PHP
* Web application framework (WAF) - Joomla, Rails, Django
* Solution stack - LAMP, WAMP, MEAN

|

## Model-View-Controller ##
A software pattern that separates the internal representation of information from the way that information is presented to the user.

* **Model** - application data, business rules, logic and functions
* **View** - output representation of information
* **Controller** - accepts input and converts it to commands for the model or view

### Database ###
A database is an organized collection of data modeled in a way that supports processes requiring this information -- the M in MVC.  Below are some of the popular database management systems (DBMSs) used for web development:

* RDBMS - Postgres, MySQL
* NoSQL - MongoDB

## Ruby ##

### Strings ###

#### String Basics ####
```ruby
# string literal
"this is a string"
=> "this is a string"

# backslash escapes quotes
'this string has \'single quotes\' in it'
"this string has \"double quotes\" in it"

# backslash notation can be used for line returns
# this only works with double quotes
"this is a\ntwo line string"
'this is NOT a\ntwo line string'

# string interpolation evaluates and converts result to a string
"three plus three is #{3+3}"
=> "three plus three is 6" 

foobar = [0, 1]
"the value of foobar is #{foobar} "
=> "the value of foobar is [0, 1]" 

# interpolation works only with double-quotes
'the value of foobar is #{foobar}'
=> "the value of foobar is \#{foobar}"

# interpolation still evaluates errors
"the meaning of life is #{1/0}"
=> divided by 0 (ZeroDivisionError)
```

#### Puts vs. Prints ####
```ruby
puts "Say", "hello", "to", "the", "world"
=> "Say"
=> "hello"
=> "to"
=> "the"
=> "world"

print "Say", "hello", "to", "the", "world"
=> "Say hello to the world"
```

### Numerics ###

#### Types of Numerics ####
```ruby
123                       # Fixnum
-123                      # Fixnum (signed)
1_123                     # Fixnum (underscore is ignored)
123_456_789_123_456_789   # Bignum
123.45                    # Float
1.2e-3                    # Float
```

#### Basic Arithmetic ####
```ruby
1 + 1    # => 2
1 - 1    # => 0
2 * 3    # => 6
# To return a Float, need to use a Float number
1 / 2    # => 0, instead of 0.5
1 / 2.0  # => 0.5
1.0 / 2  # => 0.5
# modulo
1 % 2    # => 1
# exponentiation
2 ** 3   # => 8
```

### Arrays ###
```ruby
array_one   = Array.new
array_two   = []              # shorthand for Array.new
array_three = ["a", "b", "c"] # array_three contains "a", "b" and "c"
```

#### Fetching Values from Arrays ####
```ruby
array_three[0]                # => "a"
array_three[2]                # => "c"
array_three[0]                # => "a"
#negative indices are counted back from the end
array_three[-2]               # => "b"
#[start, count] indexing returns an array of count objects beginning at index start
array_three[1,2]              # => ["b", "c"]
#using ranges. The end position is included with two periods but not with three
array_three[0..1]             # => ["a", "b"]
array_three[0...1]            # => ["a"]
```

#### % Notation ####
```ruby
array_one   = %w'apple orange pear'            # => ["apple", "orange", "pear"]
array_two   = 'apple orange pear'.split        # => ["apple", "orange", "pear"]
array_one   == array_two                       # => true

array_three = %w'dog:cat:bird'                 # => ["dog:cat:bird"]
array_four  = 'dog:cat:bird'.split(':')        # => ["dog", "cat", "bird"]
array_three == array_four                      # => false
```

GitHub
------
[Cheatsheet] - quick two-sheeter on git commands

[cheatsheet]: https://github.com/github/training-materials/blob/master/downloads/github-git-cheat-sheet.pdf?raw=true

1. [Create a Repo]
2. [Fork a Repo]
3. [Pull Requests]
4. [Delete a Repo]

[create a repo]: https://help.github.com/articles/create-a-repo
[fork a repo]: https://help.github.com/articles/fork-a-repo
[pull requests]: https://help.github.com/articles/using-pull-requests
[delete a repo]: https://help.github.com/articles/deleting-a-repository
