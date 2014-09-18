## Intro to Methods

#### Learning Objectives
- students should be able to:
	* explain the principle of DRY
	* explain what a method is and why it is useful
	* "define" methods that take parameters
	* **5 MINUTE BREAK**
	* explain the terms **call** and **invoke** as they relate to methods
	* "call" methods with arguments
	* return values from a method

___
#####DRY
  * What is DRY?
    * Don't Repeat Yourself
    * a brief example with `puts` + `gets.chomp` (file open in sublime)
      * the insurance company has a indecisive CEO who decides he wants all survey answers to have an exclamation point

#####Methods
  * Definition:
    * A **method** is a reusable piece of code that can take inputs and will return output.
  * Why would we use one?
    * to abstract oft-repeated processes into a single line of code
    * to give semantic (sensible) names to common processes
  * How do you write a method? (go through the example below step by step)
    * `def` and `end`
    * `method_name()` **WITH PARENS**
    * `return` 
    * `(optional_argument1, optional_argument2
```ruby
def get_answer_to(question)
  puts question
  return gets.chomp
end
```

####Calculate the area, taking two parameters: length and width
```ruby
def area(length, width)
  puts "length: #{length}"
  puts "width: #{width}"
  return length * width
end
```

####Calculate the volume, taking three parameters: length, width and height
```ruby
def volume(length, width, height)
  return length * width * height
end

def volume(length, width, height)
  volume = area(length,width) * height
  return volume
end
```

####Calculate the square of a number
```
def square(x)
  return x * x
end
```

####Calculate the cube of a number
```
def cube(x)
  return x ** 3
end
```

- Methods Activity 
  
####Write a method, `sings_fav_lyric` that takes a lyric and yells it at the top of its lungs
```ruby
def sings_fav_lyric(fav_lyric)
  puts fav_lyric.upcase
  return "Sing it!
end
```

Why would we use a method?
  -to abstract oft-repeated processes into a single line of code
  -the toaster example
  
The Difference Between Defining a Function and Calling a Function 

Scope within the function
