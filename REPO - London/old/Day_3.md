# Homework Review | 9:00 - 9:30


# Debugging | 9:30 - 10:00
- Why do we debug?
  - do we get code right first time?
  - can we know what's going on in there?

- Debugging methods
  - Guesswork (intuition?!)
  - Process of elimination
  - Testing (manual and automatic)
  - Console output
  - Breakpoint
  
- Install Pry & Pry-Debugger

- Add debgging to our calc-it app
  - wouldn't it have been easier to have solved the problems if we could debug!
    (but it would have been harder to learn)
    
# Arrays | 10:00 - 11:00
- What are arrays?
  a = [1, 2, 3, 4]
  a
  a.size
  a.first
  a.last
  a[0]
  a[-1]

- Nested arrays
  a = [1, 2, 3, 4, [5, 6, 7]]
  - how many elements in the array?
  - how to access the nested array?
  - .flatten
  
- Manipulating arrays
  a.push
  a.pop
  a.shift
  a.unshift
  a[1] = 10
  a + [11, 12, 13]
  [1, 2, 3] | [3, 4, 5]
  
- Making Arrays
  []
  Array.new
  "The quick brown fox jumped over the lazy dog".split
  %w(the quick brown fox jumped over the lazy dog)
  # .split takes a parameter of a match to split on
  "The quick brown fox jumped over the lazy dog".split('') # eek!
  
- Handy array methods
  - .any? .all? .none? .include? .join
  - .flatten .compact .uniq  
  - .max .min
  
  
# Symbols & Hashes | 11:15 - 12:00



# Blocks & Enumeration | 13:00 - 14:45

- Blocks
  - Yesterdays we touched on blocks
    10.times { |i| print i, " " }

  - A block is a portion of code that is passed to a method - in fact, blocks can be considered little methods of their own, just with no name
  
  - Used very often with "enumerable" objects (Arrays, Hashes) to run the block against each element in the collection.
  
  def print_name(name)
    print name, " "
  end
  names = %w(Fred Wilma Barney) 
  for i in 0..names.size
    print_name(names[i])
  end
  
  or...
  
  %w(Fred Wilma Barney).each { |name| print name, " " }

  or ...
  
  %w(Fred Wilma Barney).each do |name| 
    print name, " "
  end
  
  - We generally use {} for one-line blocks, and "do..end" for multiline blocks
  
  - Our own block:
  def hiya
    yield
  end
  hiya { puts "hiya" }
  
  - ensuring a block is given:
  def hiya
    if block_given?
      yield
    else
      puts "no block given :-("
    end
  end
  hiya { puts "hiya" }
  
  - Block parameters:
  def talk_to_fred
    yield "fred"
  end  
  talk_to_fred { |i| puts "hiya, #{i}" }
  
  - This is what powers enumerable - each element is yielded to the block, and different enumerable methods do different things with the result
    %w(Fred Wilma Barney).each { |name| print name, " " }


  - Let's play with blocks:
  
    %w(Fred Wilma Barney).map { |name| name.reverse }
  
    %w(Fred Wilma Barney).each { |name| puts name*3 }
  
    (1..100).each { |i| puts i if i % 7 == 0 }    

    %w(Fred Wilma Barney).each_with_index { |name, index| puts "#{name} is #{index.odd? ? "boys'" : "girls'"} name"}
    
    (1..10).each_cons(3) { |a| puts a }    
  
    (1..10).each_slice(3) { |a| puts a }    
  
    (1..3).cycle(3) { |i| puts i }    
  
    (1..10).select { |i| i.even? }    
  
    (1..10).detect { |i| i.even? }    
  
    (1..10).group_by { |i| i%3 }    

    # Hashes are enumerable too
    {name: 'michael', age: 40, location: 'Back Hill'}.each_pair { |k, v| puts "key '#{k}' has the value '#{v}'"}    
  
    "The quick brown fox jumped over the lazy dog".split.each do |word|
      if word.length.even?
        puts word.downcase
      else
        puts word.upcase
      end
    end
    
    - Aside... if there's time, show the previous method refactored
        "The quick brown fox jumped over the lazy dog".split.each do |word|
          puts (if word.length.even?
            word.downcase
          else
            word.upcase
          end)
        end
        
        "The quick brown fox jumped over the lazy dog".split.each do |word|
          puts word.__send__(word.length.even? ? :downcase : :upcase)
        end
      
- Double-reinforce the API references:
  [Hash](http://www.ruby-doc.org/core-1.9.3/Hash.html)
  [Array](http://www.ruby-doc.org/core-1.9.3/Array.html)
  [Enumerable](http://www.ruby-doc.org/core-1.9.3/Enumerable.html)


- If there's time.....
    Given the following data structure:
    
    users = {
      "Jonathan" => {
        :twitter => "tronathan",
        :favorite_numbers => [12, 42, 75],
      },
      "Erik" => {
        :twitter => "sferik",
        :favorite_numbers => [8, 12, 24],
      },
      "Anil" => {
        :twitter => "bridgpal",
        :favorite_numbers => [12, 14, 85],
      },
    }
    
    How would you access Jonathan's Twitter handle (i.e. the string "tronathan")?
    How would you add the number 7 to Erik's favorite numbers?
    How would you add yourself to the users hash?
    How would you return the array of Erik's favorite numbers?
    How would you return the smallest of Erik's favorite numbers?
    How would you return an array of Anil's favorite numbers that are also even?
    How would you return an array of the favorite numbers common to all users?
    How would you return an array containing all users' favorite numbers, sorted, and excluding duplicates?
    



# Lab Partners Lab | 15:00 - 17:00
  
- Working in pairs, the students should create an app that will randomly assign groups for the class. The app takes a group size as input and prints out what the groups are. If the class does not divide evenly into the group size, any remaining students should just be tacked on the last group.

- Demo the solution for the students if they need clarification on how the app works.

- Students should start by creating projects in Trello and GitHub. They should make sure to write user stories before they begin to code.  

- Review LabPartners Lab (4:40 - 5:00)



# MTA Lab Homework 

- Objective:
  Apply arrays, hashes and blocks.

- Activity:

  - Working in pairs, students should create a program that models a simple subway system.
  - Demonstrate the working code for students so they have an idea of how it works.
  - The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

  - There are 3 subway lines:

    - The N line has the following stops: 
      Times Square, 34th, 28th, 23rd, Union Square, and 8th
    
    - The L line has the following stops: 
      8th, 6th, Union Square, 3rd, and 1st 
      
    - The 6 line has the following stops: 
      Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.

  - All 3 subway lines intersect at Union Square, but there are no other intersection points. 
    (For example, this means the 28th stop on the N line is different than the 28th stop on the 6 line.)

- Give students the following hints:

Get the program to work for a single line before trying to tackle multiple lines.
Diagram how the program works by drawing out the subway lines and their stops and intersection.
The subway lines are keys in a hash, while the values are an array of all the stops on each line.
The key to the lab is the intersection of the lines at Union Square. Google “ruby array intersect.”
Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated).

