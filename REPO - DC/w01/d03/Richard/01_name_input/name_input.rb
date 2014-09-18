names = []

while true

  puts "#{names.length} names so far. Enter a student name, or type 'done'"
  name = gets.chomp

  break if name == "name"

  names.push(name)
end

puts "You collected #{names.length} student names.}"
puts "The names are: #{names.join(', ')}"
