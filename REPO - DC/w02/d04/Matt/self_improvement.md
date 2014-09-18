## Self-Improvement Homework

#####Step 1:
Review your self-assessment from last week. If you haven't filled it out yet, do so. This is mandatory.

#####Step 2:
Target 10 concepts or mechanics you feel unsure of, and write them into the numbered list below.

#####Step 3:
Research all of the items you listed, and write in either an explanation (if the item is a concept), or the necessary code snippet (if the item is a mechanical question).


1. Enumeration allows searchable and sortable methods to access/display data. I've found myself confused, at times, about which method to use and particularly what to place inside of the block. Below is an exampy from ruby-docs, which makes sense to me in this example:
```ruby
hash = Hash.new
%w(cat dog wombat).each_with_index { |item, index|
  hash[item] = index
}
hash
```

**More**
[.reduce](http://apidock.com/ruby/Enumerable/reduce)/[.inject](http://apidock.com/ruby/v1_9_3_392/Enumerable/inject)
[.map](http://apidock.com/ruby/v1_9_3_392/Enumerable/map)

2. Yields: methods may receive a code block in order to perform arbitrary segments of code.//

When a method expects a block, it invokes it by calling the yield function.//



3. OOP

"Object-oriented programming (OOP) is a programming language model organized around objects rather than "actions" and data rather than logic. Historically, a program has been viewed as a logical procedure that takes input data, processes it, and produces output data.

The first step in OOP is to identify all the objects the programmer wants to manipulate and how they relate to each other, an exercise often known as data modeling. Once an object has been identified,  it is generalized as a class of objects (think of Plato's concept of the "ideal" chair that stands for all chairs) which defines the kind of data it contains and any logic sequences that can manipulate it. Each distinct logic sequence is known as a method. Objects communicate with well-defined interfaces called messages."

[link](http://searchsoa.techtarget.com/definition/object-oriented-programming)

[WDI OOP gist](https://github.com/runtropolis/WDI_DC_1/blob/master/w01/d05/INSTRUCTOR/intro_to_oop.md)

4. Git vs GitHub

git is a version control tool, GitHub is a hosting service for repos

5. Methods vs Blocks

"A method is also a block of code. Methods are not bound to the local variables around them. Rather, they are bound to some object and have access to its instance variables"

[blocks and methods](http://eli.thegreenplace.net/2006/04/18/understanding-ruby-blocks-procs-and-methods/)

"A block is a way of grouping statements, and may appear only in the source adjacent to a method call; the block is written starting on the same line as the method call's last parameter (or the closing parenthesis of the parameter list). The code in the block is not executed at the time it is encountered. Instead, Ruby remembers the context in which the block appears (the local variables, the current object, and so on) and then enters the method."

[rubylearning]

6.

7.

8.

9.

10.


__NOTE:__ This is mandatory


