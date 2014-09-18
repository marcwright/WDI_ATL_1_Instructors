def convert_to_fahrenheit(temp)
  return (temp.to_i * (9/5)) - 459.67
end

def convert_to_kelvin(temp)
  return (temp.to_i + 273.15)
end

puts convert_to_fahrenheit(0).to_s + " F"
puts convert_to_kelvin(32).to_s + " K"