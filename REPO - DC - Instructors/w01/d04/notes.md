## Schedule

* Method & Scope Review
* Imperative vs Declarative Programming
* Blocks & Yield
* Other Enumerables
* File I/O
* String Manipulation

### Ruby 2.1.1

brew uninstall readline && brew install https://raw.githubusercontent.com/Homebrew/homebrew/0181c8a1633353affefabe257c170edbd6d7c008/Library/Formula/readline.rb

### Workflow and Sublime Shortcuts - Adam
* cdhw function

1. Open up all the files in this directory with Sublime (subl .)
2. Switch between tabs using (cmd+shift+bracket)
3. Switch to a certain file using (cmd+t)
4. Find text using (cmd+f). Select all using (option + enter)
5. Close tabs using (cmd+w)
6. Quit a program using (cmd+q)
7. Switch between Sublime windows using (cmd+`) and close excess windows!
8. Save with (cmd+s)
9. Multi-click with (cmd)
10. Move between words using (alt)

### Gut Check - Things we've learned
* Command Line
* Git & Github
* Data types
* Getting input and printing output
* Conditionals
* Loops
* Methods

### Array & Hash Review 
* Explain what an array is
* Explain what a hash is
* Explain the difference between a symbol and a string
* Explain the difference between an array and a hash and when you would use each
* Explain the difference between running a Ruby program from the console and using pry. What does binding.pry do?

## Method & Scope Review

Purpose: reinforce the concept of references, assignment, and further develop the concept of scope.

##### Setup

Two tables in the front of the room. Label the left table: WDI.

* Have two students sit at the table on the left (Adam, Inhak)
  * On the board, write a hash representing both. {:demeanor. :money}
  * **This is the literal expression of their data structure**

##### Names

* "However, it is cumbersome to write this, and as objects they are mutable: so let's give them names..."
* Write the students' names on name plates.
  * Write the code to assign them names on the board
* Give them multiple nicknames used in class (name plates).

##### Methods

* Now, create a method called "Vegas," and place a name plate called "Client"
* Vegas will
  * if the argument has a demeanor of "reserved", change it to "wild", otherwise nothing
  * if the argument has a lot of money, reduce it, otherwise increase it

##### Send student to Vegas
* Have Inhak go to Vegas, but take his name plate with him (now labeled "WDI: Inhak")
* Does Vegas know about Adam?
* Update Inhak's demeanor
* Return Inhak to WDI

##### Lessons

* Methods have names for what gets passed into them
* Methods have their own scope and local variables

##### Name Generator

---

## Imperative vs Declarative Programming

### Learning Objectives

* Explain the difference between imperative and declarative programming
* Explain what a block is
* Explain what yield does in the context of a block
* Use built in Ruby methods to enumerate over a collection
* Explain the difference between `.each` and `.map`
* Explain when and how to use the enumerator methods  `.each`, `.map`, `.join`, `.select`, `.reduce`

* Imperative - describes computation in terms of statements that change a program state

* Declarative - expresses what the program should accomplish without prescribing how to do it in terms of sequences of actions to be taken

* Example: Shutting the door.

* In a procedural environment we **iterate** over a data structure via a loop

* In Ruby that data structure would be an object (a collection), and we normally use a type of method called an enumeration on that object.

* We have also begun seeing the world thru object-oriented eyes, by using enumerations instead of loops.

### Code Excercise

```ruby
shows = ["Girls", "Game of Thrones", "House of Cards", "The Bachelor", "Modern Family", "Mad Men"]
```
  
1. Using loops, print out "I <3 " followed by the name of each tv show in the array.
* Now do it again for both, but this time print the names in all caps.

```
i = 0
while i < shows.length
  puts "I <3 #{shows[i]}"
  i += 1
end

while i < shows.length
  puts "I <3 #{shows[i].upcase}"
  i += 1
end
```

### The Enumeration `.each` and `yield` (1 hour)

Let's rewrite the above so that our code is DRY and follows a more declarative programming approach

```
def loop_and_print(data_structure, prepend_string, caps?)
  #...
end
```

It seems like this is very hard... If only there was a way to cut and paste a piece of code from outside of the method to its inside...

Tada!

```
def loop_and_print(data_structure)
  i = 0
  while i < data_structure.length
    yield data_structure[i]
  end
end
```

`.each` is *exactly* this, except that it is a method defined for the context of the collection, and thus is called on it instead of receiving it as an argument. We'll look at that (object-oriented programming) starting tomorrow.

##### `yield`

We are familiar now the concept of code reuse in the form of *defining procedures.* Code reuse is central to programming with good design.

* `yield` is an important part of Ruby. It allows us to create methods that hold all of the ingredients of a procedure except one.

* It gives us the ability to cut and paste code into existing code on the fly. This makes code reuse much simpler!


###### Method - Bound to object, own scope

```ruby
def(args)
end
```

* method parameters: any number of arguments, only one block
* only one `yield` per method
  
* enumeration:
  * syntax: `array_name.enum_method {|pipe_arg| code_block}`
  * examples: `.times`, `.upto`, `.downto`, `.each`, `.each_char`, `.each_line`
  * __at it's heart, an enumeration is a loop that happens inside a data structure's object (a collection), instead of outside of it__


###### Block - Set of instructions grouped together. Chunk of code you can associate with a method call.

```ruby
do |args|
end
```

* `do`/`end` vs `{`/`}`
* `|arg|`, scope


##### `.each` doesn't mutate it's object, and what it returns...

* `.each` literally just performs some block of Ruby expressions some number of times, defined as the length of a collection, and upon each iteration it offers up 

### More enumerations: `.map`, `.join`, `.select`, `.reduce`

Find the ruby-docs entry for Enumerable.

##### `.map`

**Excercise:**

* Use a loop and `.each` to create a new array that holds the strings "I <3 " and album name.
* Use the definition of `.map` to create that same array.

##### Wine Cellar Exercise

##### Students Exercise

# File I/O

## Learning Objectives

* __File I/O__
  * Read data in from a file and parse it
  * Write data to a file

## Framing

Until now, we've been writing programs that take input but that can't store or *persist* that data. This should illustrate that we can save data to a file, and later retrieve that data. 

* This should prepare you for thinking about the more used form of persistent storage, databases.
* Retreiving information and instantiating objects from that data should help prepare you for common Rails activities (ActiveRecord)...

##### Lesson

* the filesystem, OS and abstraction
* every language has a library for interacting with the filesystem in an abstracted way, focused on input and output (ie saving/writing or retrieving/reading data...)
* Ruby uses the class `File` (look at ruby-docs!):
  * `File::new` and `File::open` are (for the most part) synonyms
  * `File.new(file_name, mode)` returns an object often called a *stream*
    * modes: `r`, `r+` (read-write, start of file), `a+` (read-write, start at end of file)
  * `File::open(file_name, "r") do |file_stream| ... end` also works...
  * `File#close` to close the stream... ALWAYS CLOSE IT!
* Ruby defines I/O such that: `IO#gets`, `IO#puts`
  * read: `IO#read {|line| ... }` or `IO#each_line`
  * write: 

##### Zoo I/O

##### Receipt Generator Exercise

# String Manipulation

* .chomp
* []
* .split
* .join
* .include?
* .gsub

# Regex


