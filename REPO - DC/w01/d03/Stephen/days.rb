# Stephen Stanwood (stephen@stanwoodsolutions.com)

print "Hello!  What day is it? "
day = gets.chomp.downcase
case day
when "friday"
  puts "TGIF!"
else
  puts "Have a great #{day.capitalize}!"
end
