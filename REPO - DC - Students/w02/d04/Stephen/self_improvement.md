## Self-Improvement Homework

#####Step 1:
Review your self-assessment from last week. If you haven't filled it out yet, do so. This is mandatory.

#####Step 2:
Target 10 concepts or mechanics you feel unsure of, and write them into the numbered list below.

#####Step 3:
Research all of the items you listed, and write in either an explanation (if the item is a concept), or the necessary code snippet (if the item is a mechanical question).


(1) I'm not great with rpsec syntax yet, but I feel a lot better about it this afternoon than I did before the code retreat this morning.  More reps on that are coming and will help.  Basics:

  describe Class
   describe "::new" do
   ...
   end
  end

(2) I've been mixing up Ruby methods with those from other languages or from my imagination.  A few repeat offenders:

  .include? [vs. .contains], .delete_at, [.at isn't a Ruby thing]

(3) .each syntax proves tricky sometimes.  Examples:

  arr.each { |elem| puts "Lots of #{elem}s!" }
  pets.each { |p| print "Ten #{p}s" }

(4) A couple of shortcuts in Sublime that I tend to forget but that are awesome:

  CMD-CTL-G after CMD-F to find and then edit multiple instances of something, CMD-SHIFT-[ or ] to cylce through tabs

(5) Using hashes vs. using objects:

  "Use hashes when you just have information about something, use objects when you want to do something with them." [wanted to write that down from today]

(6) File-reading in Ruby:

  f = File.new("data.txt","r")
  while (line = file.gets)
    # do something which each line
  end
  f.close

(7) Some of the enumerators that we've spent less time with:

  # sum all of the items in a list
  arr.reduce(+:) or arr.inject(+:)

  # selecting even numbers
  arr.select { |num|  num.even?  }

(8) case statement syntax [not switch-case]:

  case ___
  when ___
    ___
  when ___
    puts "It's 6"
  else
    ___
  end

(9) writing data to a file in Ruby:

  f = File.open("output.txt", "r")
  f.puts "Going into the file!"
  f.close

(10) Balancing time and staying healthy throughout the course.  So far, so good!  Looking forward to the rest of the way. =)



