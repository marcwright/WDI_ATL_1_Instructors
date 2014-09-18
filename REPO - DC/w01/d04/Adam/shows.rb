require 'pry'

show = ["girls", "simpsons"]

count = 0

while count < show.length
  puts "I <3 #{show[count].upcase}"
  count = count + 1
end

def loop_and_print(array)
  i = 0
  while i < array.length
    yield array[i]
  end
  i += 1
end

show.each do |show|
  puts "I <3 #{show}"
end

show.map do |show|
  puts "I <3 #{show}"
end

feelings_toward_shows = []
shows.each do |show|
  feelings_toward_shows.push("I <3 #{show}")
end

feelings_toward_shows = show.map dp |show|
  "I <3 #{show}"
end



## The Block
#do |show|
#  puts "I <3 #{show}"
#end

## Calling the method with the block
#loop_and_print(show) do |show|
#  puts "I <3 #{show}"
#end



binding.pry
