a = 10
b = "hello"  #Change to 7
begin 
  c= a + b
rescue
  puts "A and B are different types"
else
  puts "The result is #{a+b}"
end 