names = []

while true

  puts"#{names.length} so are. Enter a student name or type 'done'"
  name = gets.chomp

  break if name =="done"
  names.push(name)
end

puts "you collected #{names.length students names.}"
puts "The names are #{names.join}"

