## Question 1

Explain what object-oriented programming is. Why would we program in this way?

#### Example 1

Object-oriented programming allows data and behavior to be combined in a mechanism called a "class."  This makes for strong programs because individual parts that don't require "awareness" of each other may be kept separate, or encapsulated.  Encapsulation is a good thing for functionality, security, DRY-ness, puppies, kittens and certain wild flowers.

#### Example 2

"Object oriented programming is a philosophy/practice in the programming world that espouses that idea that each object in a program should be a self-contained tool for performing a specific and limited task. An object includes things that we can think of as 'things' or 'nouns' in that they themselves are what is acted upon to accomplish a specific goal. Objects have a specific set of methods that can be called on them to carry out a defined action relevant to the function of the program.

We use object oriented programming because it has a lot of benefits. Specifically it allows us to reduce confusion and repetition in our code by separating all the necessary functions into distinct sections that can continue to function even if  there are changes in different parts of the program. In addition to the organizational benefits, OOP also allows us to create our own objects to carry out whatever functions we may need. This ability gives us near unlimited potential to solve problems in unique and concise ways."

## Question 2

Explain what `git` is and why we use it. Explain what GitHub is and its relationship to `git`.

#### Example 1

"git is version control. the way that programmers use to set states for their programs. If multiple people are editing the program, it allows for branches to be created an merged effectively so that the number of versions don't get out of control. It also allows for the programmers to add stages to their programs, so that if something doesn't work, they can go back to it.

Github is the website that consolidates repositories so that people all over the world can fork an open repository and edit the programs to create their own versions and also improve the programs if they need to. It allows for git to work on a much larger scale, with collaborators all over the world."

## Question 3

Compare and contrast the enumeration methods `.each`, `.map` and `.select`. Be sure to explain when you would use each one.

#### Example 1

* .each iterates through an array or hash and performs the following block on each item but returns the intact original hash or array.

* .map iterates through an array or hash and performs the following block on each item while returning an empty array. 

* .select iterates through an array or hash and returns those items that fit the criteria dictated by the block in an array.

#### Example 2

"To start, an Enumeration method, like .each, .map, and .select, will iterate over a specific data structure, like an array.

What these functions do is perform a specific task on every item held within the array - the functions are defined by what is held within their respective 'block' or group of functional code.

* If the '.each' method is called on an array, it will perform it's function on the array items, but return it's original array value.  This is useful when we do not want to alter the original state of the array but want to perform a task over the data within.

* If the '.map' method is called on the array, it will perform it's function on the array items, but return a new array 'mapped' with information based on a parameter passed by the block to the array. This is useful if we want to get additional data, while preserving our original structure (ie, asexual frog dna)

* If the '.select' method is called on an array,it will perform it's function on the array items, but return a new array with only the 'select'ed items from the original array.  The conditions are set by parameters in the block.  This is useful for when we want to be 'select'ive about the information we pull out of an array to assign to our new array.  "

## Question 4

Explain what arrays and hashes are. Compare and contrast arrays and hashes and when you would use each.

#### Example 1

Arrays are a data structure from which elements can be retrieved based on an index (e.g. 0, 1, 2, 3...).  Hashes are a data structure that utilizes key-value pairs to store (the value) and retrieve (via the key).  Hashes are good for describing characteristics (like :first_name, :age), whereas arrays are useful when you have a bunch of data that you want to order in some logical way.

#### Example 2

"Arrays are an organized list, where each item in the list has an index number, beginning with 0 for the first item in the list.

Hashes are a series of key-value pairs, where each key points to a value.

You would use arrays when the order of the collection is important. You would use hashes when you want to capture data, with the data type (name, age, etc.) as the key, and the data piece as the value."

## Question 5

```
a = 10
b = "b"
c = "c"
a = a + b.to_i
b.upcase!
b = b + c
d = a.to_s + b + c
```

What does `d` equal?

##### Answer

* "10Bcc"