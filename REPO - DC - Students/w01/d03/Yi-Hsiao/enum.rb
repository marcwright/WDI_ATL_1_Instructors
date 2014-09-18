# ARRAYS
# ------
the_array = [5, 8, 15, 16, 23, 42]


## each
puts "\narray.each"

the_array.each do |i|
  puts i
end


## each_index
puts "\narray.each_index"

the_array.each_index do |i|
  puts i
end


## each_with_index
puts "\narray.each_with_index"

the_array.each_with_index do |value, index|
  puts "#{value}, #{index}"
end


## map
puts "\narray.map"

mapped = the_array.map do |i|
  i * 10
end

puts mapped.join(', ')


## map!
puts "\narray.map!"

bang = the_array.dup
bang.map! do |i|
  i * 10
end

puts bang.join(', ')
puts the_array.join(', ')


## select
puts "\narray.select"

selected = the_array.select do |i|
  i > 20
end

puts selected.join(', ')


## max
puts "\narray.max"
puts the_array.max



# HASHES
# ------
the_hash = { a: 5, b: 8, c: 15, d: 16, e: 23, f: 42 }


# keys
puts "\nhash.keys"
puts the_hash.keys

# values
puts "\nhash.values"
puts the_hash.values


# each
puts "\nhash.each"

the_hash.each do |i|
  puts i.join(', ')
end


# each_pair
puts "\nhash.each_pair"

the_hash.each_pair do |key, value|
  puts "#{key}, #{value}"
end


# select
puts "\nhash.select"
selected = the_hash.select do |i|
  the_hash[i] > 10
end

puts selected