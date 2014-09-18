# Stephen Stanwood (stephen@stanwoodsolutions.com)

def to_fahrenheit(cel_temp)
  return (cel_temp * 1.8) + 32
end

def to_kelvin(cel_temp)
  return cel_temp + 273.0
end

print "Temperature (in Celsius)? "
cel_temp = gets.to_f

print "Convert to F or K? "
case gets.chomp.chars.first.downcase
when "f"
  puts "#{cel_temp} C is #{to_kelvin(cel_temp)} K"
when "k"
  puts "#{cel_temp} C is #{to_fahrenheit(cel_temp)} F"
else
  puts "Pick 'K' or 'F'!"
end
