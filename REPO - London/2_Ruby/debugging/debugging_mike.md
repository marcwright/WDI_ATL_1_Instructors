#debugging

#preframe - this is going to be useful all the way through the course - it's not that difficult but very powerful and will help save you time. It is building on the work you did with Miachel and Mathilda yesterday.

question:
Who sat down for their homework - started typing. Didn't stop, ran thir code and it all worked perfectly?

What sort of errors did you get?  
(syntax errors and structural)
(undefinied method or local variable)
(could not convert string into fixednum)

After you got the program running did it give you the right answer?
(ruby will run a program however you tell it - it is semi clever)


- Debugging methods
  - Guesswork (intuition?!)
  - Process of elimination
  - Testing (manual and automatic) (irb)
  - Console output
  - Rubber 
  - Breakpoint


Someone has built a tool to help us out.

http://pryrepl.org/
gem install pry

https://github.com/deivid-rodriguez/pry-byebug
gem install pry-byebug

(this will install pry too)

type pry

def students
  nosStudents = 18 

  nosDesks = 20
  if nosStudents = nosDesks 
      message = "All the desks are full"
  end
     end

  puts "There are #{nosStudents} students and #{nosDesks} desks"
end

add binding.pry



