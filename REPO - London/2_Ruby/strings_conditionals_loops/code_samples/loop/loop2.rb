loop do
  print "type something.... "
  line = gets.chomp
  break if line =~ /q|Q/
end
