def prompt(query)
  puts query
  return gets.chomp.upcase
end

answer = prompt('What is food?')
puts answer

# def is a keywork
# end closes the method
# prompt is the method name
# (query) is parameter
# query is a local variable
# return

