def convert_to_f(cels_temp)
  f_temp = cels_temp * 9/5 + 32
  return f_temp
end

puts convert_to_f(100)
puts convert_to_f(0)
