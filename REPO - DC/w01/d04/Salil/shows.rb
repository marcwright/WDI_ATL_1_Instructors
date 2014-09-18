shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]
arry = []
count = 0

shows.each do |i|
  arry[count] = "I <3 #{i}"
  count += 1
end

puts arry

shows.map! {|show| "I <3 " + show}
puts shows
