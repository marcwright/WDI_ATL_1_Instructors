require 'pry'

# puts = "Can you tell me the age on your ID, here?"

# def drinking_age(age)
#   return age
#     answer = gets.chomp
#     age = answer
#       if age.io_i < 21
#         puts "I'm sorry, I can\t let you in"
#       elsif age > 21
#         puts "Come in, but behave yourself!"
#       end
# end

def drinking_age?(age)
  if age < 21
    puts "You can't drink here."
    return false
  else
    puts "I will buy you one!"
  end
end

drinking_age?(19)
drinking_age?(22)


