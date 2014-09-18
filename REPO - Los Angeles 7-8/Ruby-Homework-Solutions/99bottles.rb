# run it from the command line: ruby 99bottles.rb | say
b = 99

while (b >= 1)
  print "#{b} bottle"
  print "s" if b > 1
  print " of beer on the wall, #{b} bottle"
  print "s" if b > 1
  puts " of beer."
  break if b == 1
  print "Take one down, pass it around, #{b-=1} bottle"
  print "s" if b > 1
  puts " of beer on the wall."
  puts
end

puts "Take one down, pass it around, no more bottles of beer on the wall."
puts
puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store to buy some more, only to get mugged."

