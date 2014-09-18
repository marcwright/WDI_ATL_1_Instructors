# Day 2


## Agenda

| Time | Topic | Objectives |
|:----------|:-----------|:-----------|
|9:00 - 9:30|Review|
|9:30 - 9:50|Finding stuff out|Find out where we can find out information
|9:50 - 11:30|Ruby Basics|Identify key aspects of the Ruby language|
|**11:30 - 11:45**|**Break**|
|11:45 - 12:30|Strings, Conditionals, Loops|Use strings, conditionals, and loops|
|**12:30 - 1:30**|**Lunch**|
|1:30 - 2:45|Functions|Use functions to make code more efficient|
|**2:45 - 3:00**|**Break**|
|3:00 - 5:00|CalcIt Lab Basic - Review|
|5:00 - 5:30|Class Closing, 1:1's, Start HW|
|Homework|CalcIt Lab - BMI & Mortgage, Trip Calculator|


| Time | Topic | Objectives |
|:----------|:-----------|:-----------|
|9:00 - 9:30|Review|

## Review
yesterday was a bit of an atypical day... today we start to get into the rhythm for the course.

- Unix basics
- Sublime text
- Trello

- What did we learn in our homework?

- Two extra bits of git info:
  Branch and checkout at the same time:
    git checkout -b branch2

  Pushing all branches... 
    git checkout -b branch1
    git checkout -b branch2
    git checkout -b branch3
    git push --all

| Time | Topic | Objectives |
|:----------|:-----------|:-----------|
|9:30 - 9:50|Finding stuff out|Find out where we can find out information

## Finding stuff out
- Pop Quiz
  - Hands up if there's a subject you know *really* well
  - Keep your hand up if you know *everything* about the subject...
    - Really... *everything* you wrote the book? *phew* you can take a break
    - everyone else...
    
- Let's think of some ways that we can think of solving our problems:
  - problem: You're working on a photo-sharing social networking app, and you want to only allow png, and jpg files... but you don't know how...
    - ask co-workers
    - ask the community (on the internet)
    - look up documentation ('man')
    - "google" - look on the internet
      
- The difference in these two is that one is relying on others... the other is finding for ourselves
  - let's learn how to fish, so we can feed ourselves
    
- How to solve our own problems
  - Instructors aren't always going to be here
  - Are we the first person to have this problem? Are we unique, beautiful snowflakes?
  
- What's the cost of asking others?
  - Unless they're working on the same topic, it costs them time to get out of one train of thought, and onto the other, and then back again
  - Good will... the more you ask someone, the less inclined they get to answer  
  - RTFM and STFW

- Google-fu
  - Forming good searches
    - "" around explicit phrases
    - include words that specify your problem
    
  - Common resources
    - [ruby-doc.org]
    - [api.rubyonrails.org]
    - [apidock.com/rails/browse]
    - [w3schools.com]
  
  - Keywords to use in searches - cheatsheet, api, "ruby rails"
  - test - "Whoa, I've been playing with this awesome app called 'fossil' as an alternative to git."
    - [www.fossil-scm.org]
  
- Then ask...
  - Stackoverflow, and associated sites,
  - Mailing lists, IRC
  - asking smart questions - http://www.catb.org/esr/faqs/smart-questions.html ---- ASSIGN AS HOMEWORK TO READ
  
    - Describe the symptoms of your problem or bug carefully and clearly.
    - Describe the environment in which it occurs (machine, OS, application, whatever). Provide your vendor's distribution and release level (e.g.: “Fedora Core 7”, “Slackware 9.1”, etc.).
    - Describe the research you did to try and understand the problem before you asked the question.
    - Describe the diagnostic steps you took to try and pin down the problem yourself before you asked the question.
    - Describe any possibly relevant recent changes in your computer or software configuration.
    - If at all possible, provide a way to reproduce the problem in a controlled environment.

- Give back... when you do have a problem, would it be good to leave the answer for the next guy?
  - where can you do this? blog it, or write about it, or contribute to the community
  - register on stackoverflow

- Reassurance!
  - For the duration of this course... of course the instructor team is there to answer your questions; we won't tell you bluntly to RT*M
  - but we would *love* to see you starting to put the research in to solving your own problems, because in most cases...
  - the answer's out there!


| Time | Topic | Objectives |
|:----------|:-----------|:-----------|
|9:50 - 11:30|Ruby Basics|Identify key aspects of the Ruby language|

## Ruby basics - What is Ruby (10 mins)
- We're going to go over the basics of the Ruby programming language, and try lots of combinations of functionality as we can to 

- What is Ruby
  - Created back in 1995 by Yukihiro Matsumoto - "I hope to see Ruby help every programmer in the world to be productive, and to enjoy programming, and to be happy. That is the primary purpose of Ruby language."
  - It's an interpreted scripting language
  - What do we use programming languages for?
  - Why should we use one over the other?


## Overview (10:00 - 10:15)
* Types:
  - Everything in Ruby is an "object", and objects have a "type"
    - We'll cover OO programming in depth later, but for now, if we want to know what Ruby thinks something is, we can ask it with ".class"
    - 1.class
    - "1".class
    - 1.0.class (or "(1.0).class" - disambiguation)

  * What is a number?
      * ints and floats
  * What is a string?
* Variables:
  * What is a variable?
    - types of variables: local, instance, class, global
  * Constants
  * Naming conventions
      * CamelCaseForClasses, UPPER_CASE_SNAKE_CASE_FOR_CONSTANTS, lower_case_snake_case_for_everything_else
* Gems
  * What is a gem?
  * Give some examples and what they do
  * Show gem list in the terminal


## Ruby Basics in IRB (10:15 - 10:45)
- Code along in IRB
  - x = 1
  - x
  - x.class
  - x + 1
  - x
  - x += 1
  - other operators... / * - ** %

- Duck typing
  - 10 / 2
  - 5 / 2
    - ??? What?! Why is it "2"?!! Can't Ruby do maths?! We found a bug!
  - 5 / 2.0
  - This is called "Type Coercion" - Ruby figures out what we want to do. Also known as "Duck Typing"

- Duck type strings?
  - "5" / 2.0
  - "5".to_i
  - "5".to_i / 2.0
  - Sometimes unexpected results
    - "Hello".to_i
    - "4vid".to_i

- What answer do I want? How can the computer (or Ruby) know?
  - "5" + 5 # do I want "55" or "10"?
  - How to get "10"? "5".to_i + 5
  - How to get "55"? "5" + 5.to_s
  - This is called "String Concatenation"

| Time | Topic | Objectives 
|:----:|-------|------------
|**10:45 - 11:00**|**Break**|


## Equality, evaluation, boolean (11:00 - 11:45)
- Equality
  - we've said that Ruby knows the type of objects, but will coerce them for us if it can, but how do we tell if two objects are the same, different, bigger, smaller?
  - a = "hello"
  - b = "hello"
  - a == b
  - a != "world"
  - 1 > 2
  - 2 < 1
  - 1 >= 1
  - strings
    - "a" > "b"
    - "b" > "a"
    - "a" > "A"

- Boolean
  - Whether something is true or false  
  - true.class # remember I said everything in Ruby is an object? even "true" and "false" are objects
  - true || false
  - false || true
  - false && true
  - true && true
  - nil && true
  - !true
  - !false
  - x = "hello"
  - !x
  - x && true
  - x = nil
  - !x
  - x && true


| Time | Topic | Objectives 
|:----:|-------|------------
|11:45 - 12:30|Strings, Conditionals, Loops|Use strings, conditionals, and loops|

## Strings, Conditionals, Loops (11:45 - 12:30)
- Review string concatenation - 5mins
  - "hello" + "world"
  - "hello" + " " + "world"
  - h = "hello"
  - w = "world"
  - space = " "
  - h + space + w
- string interpolation
  - h = "world"
  - "hello #{h}"
  - "hello #{1}" # automatically casts to_s
  
- Conditionals - 15mins
  - if true then "hello" else "bye" end
  - unless true then "hello" else "bye" end
  - Aside: we don't normally see these conditionals on one line (it's hard to read...)
    instead it's normally:
      if true 
        "hello" 
      else
        "bye" 
      end
  - "hello" if true
  - "hello" if false

  - 'If' statements work very well for two conditions, with multiple conditions, we can use 'case' statements:
    - score = 6
      case score
        when 10
          "genius"
        when 8..9
          "merit"
        when 5..7
          "pass"
        else # default value is optional... without this it would return nil
          "fail"
      end

- We're reaching the limits of what we want to type in the console, we need to write bigger programs, 
  so we'll need to start working with Ruby files - 10mins
  - exit # leave the console, back to terminal
  - touch what_name.rb
  - subl what-name.rb (one line at a time)
      puts "What is your name?"
      name = gets
      puts "Hiya, #{name}"

  - touch case_statement.rb
  - subl case_statement.rb
  - paste the code from the case statement above (but need to 'puts' the output)
  - ruby case_statement.rb

- alter the program to alter the output - 2mins
  - change the score
  - add more conditions

- Loops
  - when we need to do the same thing again and again, we loop
    - for, while, until, loop
    
  (back in IRB)
  - for i in 1..10; print i, " "; end
  - x=0; until x==10; puts x+=1; end
  - what happens if the condition is never met?...
    - x=0; until x==10; puts x-=1; end # ctrl-c to exit ;-)
    - So beware of infinite loops (and their stack overflow)
  
  - touch loop.rb; subl loop.rb
    puts "what is 2 to the 4th power?"
    value = gets.chomp.to_i
    while value != 2**4
      print "nope... try again"
      value = gets.chomp.to_i
    end
    puts "yes!"
    
  - break, redo and retry
  
  - loop do
      print "type something: "
      line = gets.chomp
      break if line =~ /q|Q/
      puts line
    end
      
  - .times .upto as alternatives
    10.times { |i| print i, " " }
    1.upto(10) { |i| print i, " " }
    - the curly brackets are a special syntax called "blocks" - we'll cover them tomorrow, but they're a bit easier on the eye


|**12:30 - 1:30**|**Lunch**|
|1:30 - 2:45|Methods/Functions|Use methods to make code more efficient|

- What are methods? Are they different to functions?
  - We use them to encapsulate meaningful pieces of code into small, isolated constructs
  - We've been using them already... ".to_i", ".chomp"
  - In Ruby, they *always* return a value - whether we want it or not

- Defined with "def" then method name, end with "end"
  - name can't begin with a number
  - lower-case 
  - special characters are allowed and imply functionality (? for predicate, ! or 'bang', = for setters, etc)
- go back to our "loop.rb" file

  def warn_user
    # put me in first, coz ruby is interpreted...
    print "nope... try again"
  end
  while value != 2**4
    warn_user
    value = gets.chomp.to_i
  end

- DRY - guiding principle of coding (especially in Ruby)
  
- Parameters
  - variables passed to a method
    def greet(name)
      puts "hello, #{name}"
    end
  - optional parameters
    def greet(name="you") ...
  - splat parameters - if we have time
    def greet(*names)
      puts "hello, #{names.join(', ')}"
    end
    
|**2:45 - 3:00**|**Break**|

|3:00 - 4:30|CalcIt Lab Basic|
- we've put our parachutes on... I'm pushing you out of the plane...

- Break students up in to groups of 3. 1 member per group will be the PM. 
  Walk them through the setup, first for the PM then for the other members.

- Instructions for the PM
  - Set up GitHub
  - Start with my templates:
    https://github.com/Pavling/wdi-w1d2-calc-it
  - Create a repo on GitHub
  - Make an initial commit to GitHub
  - Create the project board on your Trello
  - Add other team members as collaborators

- Instructions for other team members
  - Clone the repo from GitHub
  - Contribute to Trello

- Make sure students can pull, make edits, and push commits back up before they start working on the project. They will likely struggle with this, so make sure they are comfortable with this before they begin to code the lab.

|4:30 - 5:00|CalcIt Review|

Go through working code to show a solution


|5:00 - 5:30|Class Closing, 1:1's, Start HW|
|Homework|CalcIt Lab - BMI & Mortgage, Trip Calculator|

  
  
  






  