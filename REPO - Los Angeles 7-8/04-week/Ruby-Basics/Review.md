#Review of some Ruby Basics

##Comments
Comments play different roles in the source code of your Ruby projects. Comments are ignored by ruby. We can use this fact for documenting our code.  Comments are also frequently used for debugging purposes. We can disable lines of code by prepending *#* to those lines we wish not to be run by ruby.

    # this is a comment - ruby doesn't care

	the_answer = 42
	# the_answer will not be set to 41 in the next line
    # the_answer = 41
    puts the_answer		# should print out 42
    
    

##Basic operations in Ruby


###Arithmetic
These operations work on integers (whole numbers) or floating-point numbers. Mixing integers and floats in one operation, as some of the examples do, produces a floating-point result.

Examples:

    2 + 3
	2 – 3
	2 * 3
	2 / 3.0


###Assignment
This operation binds a local variable (on the left) to an object (on the right).

Examples:

	x = 1
	greeting = "Hello"
	name = gets.chomp
 
###Comparison
Compare two values.

Examples:

	x == y  # compares x to y for equality
	1 < 2 	# should return true
	3 >= 7 	# should return false

###Converting strings to numbers

To perform arithmetic, you have to make sure you have numbers rather than strings of characters. *to_i* performs string-to-integer conversion.

Examples

    x = "100".to_i

##Basic IO

###Printing to the screen
There are a few ways to print something on the screen. *puts* will most likely your goto method for that, but it's good to know the details of using the other methods, too.

    puts "Hello WDI"	# will print out "Hello WDI" and add a new line
    p "Hello WDI"		# same as above, but the internal workings differ
    print "Hello WDI"	# will print out "Hello WDI" without adding a new line
    
    
###Basic Input
When writing user facing programs for the terminal, chances are, you're getting user input through the *gets* method. Gets gets ruby ready for user input. It reads the user's input up to the point where the enter key is pressed and stores the data as a string.

    x = gets			# reads the user input and stores it
    					# (including the new line character) as a string in variable x
    name = gets.chomp	# stores the entered data and strips the new line from the string
    

##Something to know about nil and bools (true, false)
The objects *true* and *false* often serve as return values for conditional expressions. You've used this in JavaScript quite often. Ruby's *nil* can be seen as JavaScript's equivalent to *null*, which results in an *undefined* value. Different programming languages have their own interpretation of what kind of (return) values should result in a *true* value in a conditional expression. So let's talk about how ruby sees the special cases of empty strings and the number 0.

Unlike the C programming language and several of its dialects (including Objective-C for iOS programming), in Ruby the number 0 cause a conditional expression to succeed. You can test this easily in *irb* or *pry*.

    >> if 0
    >>   puts "0 is true"
    >> end
    0 is true

In Ruby, an empty string is still considered a value. So if we assign an empty string to x, x as a conditional expression should return true.

	>> x = ""
    => ""
    >> if x
	>>   puts "x has a value"
	>> end
	x has a value

As a reminder, here is how JavaScript handles empty strings.

    var x = ''

    if (x) {
      console.log('x evaluates to true');
    } else {
      console.log("JavaScript doesn't like empty strings... Well... I don't like JavaScript");
    }

If we run this script (using node), this is what we would get:

    JavaScript doesn't like empty strings... Well... I don't like JavaScript

######In short
In Ruby, *false* and *nil* cause a conditional expression to fail; all other objects (including *true*, but also 0 and empty strings) cause it to succeed.
