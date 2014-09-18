#web_contents = open('http://www.stackoverflow.com')
require 'open-uri'

puts "Enter a url: "
urlspec = gets
web_contents  = open(urlspec)
web_contents.each_line do |line|
  puts line
end
