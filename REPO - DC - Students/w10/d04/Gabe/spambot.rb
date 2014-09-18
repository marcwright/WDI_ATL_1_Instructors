# ## WDI Spam Bot

# General Assembly loves loves loves to send emails. You've been tasked with building a ruby method that visits a particular site and returns an array of all the email addresses found within that sites HTML.

# __Example usage:__
# ```ruby
# retrieve_emails("http://andrewmadden.com") # => ['amadden80@gmail.com']
# ```

# ####Directions

# 1. Use HTTParty and RegExp.
# 2. Don't give up.
require 'httparty'
require 'pry'

a = ""
emails = []
while a != "end"
  puts "Enter a website to scan. Type 'end' to quit"
  a = gets.chomp
  response = HTTParty.get(a)
  regex = Regexp.new('/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/')
  emails = response.scan(regex)
  # binding.pry
  if emails != []
   puts "EMAILS FOUND!"
   puts emails
  else
    puts "NONE FOUND"
    puts emails
  end
end
