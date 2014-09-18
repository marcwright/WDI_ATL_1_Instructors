require 'pry'

#ZeroDivisionError.ancestors

# raise

# raise "argh! There was a problem!"

# begin
#   puts "the result of 3 divided by 0 is #{3/0}"
# rescue
#   puts "oh noes! I brokes :-("
# end


# begin
#   puts "the result of 3 divided by 0 is #{3/0}"
# rescue => e
#   puts "oh noes! I brokes with #{e} :-("
# end


# string = "@name = 'michael'"
# begin
#   eval string
#   # raise
# rescue SyntaxError, NameError => boom
#   print "String doesn't compile: " + boom.to_s
# rescue StandardError => bang
#   print "Error running script: " + bang.to_s
# end


# f = File.open("testfile")
# begin
#   # .. process
# rescue
#   # .. handle error
# ensure
#   f.close unless f.nil?
# end


# f = File.open("testfile")
# begin
#   # .. process
# rescue
#   # .. handle error
# else
#   puts "Congratulations-- no errors!"
# ensure
#   f.close unless f.nil?
# end


# @esmtp = true
# begin
#   # First try an extended login. If it fails because the
#   # server doesn't support it, fall back to a normal login

#   if @esmtp then
#     @command.ehlo(helodom)
#   else
#     @command.helo(helodom)
#   end

# rescue ProtocolError
#   if @esmtp then
#     @esmtp = false
#     retry
#   else
#     raise
#   end
# end


# class MichaelException < RuntimeError;end

# begin
#   raise MichaelException
# rescue #Exception => e
#   puts "oh noes! I brokes :-("
#   raise #e
# end

# begin
#   # fred # undefined method/variable
#   # 1/0
#   # 'no bug here'
#   # raise "another error"
#   rescue ZeroDivisionError => e
#     puts "dufus!"
#   raise e
#   rescue NameError
#     puts "blast! it's that 'undefined local variable or method' again"
#   rescue Exception => e
#     puts "erm... something else is wrong"
#     puts e
#   else
#     puts "no errors in your code"
#   ensure
#     puts "always running this"
# end
# puts "finished running"

# binding.pry
