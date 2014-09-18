require 'pry'
count = 0
count2 = 0


red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange
while (count == 0)
  puts dc_metro.keys
  print "What line will you depart from: "
  start_line = gets.chomp.downcase
  if (start_line == "red")
    count = 1
    start_key = :red
    puts ""
    puts dc_metro[:red].join("\n")
  elsif (start_line == "turquoise")
    count = 1
    start_key = :turquoise
    puts ""
    puts dc_metro[:turquoise].join("\n")
  elsif (start_line == "orange")
    count = 1
    start_key = :orange
    puts ""
    puts dc_metro[:orange].join("\n")
  else
    puts "Please try again"
  end
end

start = " "
until (dc_metro[start_key].include?(start))
  print "Please enter the stop you will depart from: "
  start = gets.chomp
end

while (count2 == 0)
  puts ""
  puts dc_metro.keys
  print "What line will you arrive on: "
  stop_line = gets.chomp.downcase
  if (stop_line == "red")
    count2 = 1
    stop_key = :red
    puts ""
    puts dc_metro[:red].join("\n")
  elsif (stop_line == "turquoise")
    count2 = 1
    stop_key = :turquoise
    puts ""
    puts dc_metro[:turquoise].join("\n")
  elsif (stop_line == "orange")
    count2 = 1
    stop_key = :orange
    puts ""
    puts dc_metro[:orange].join("\n")
  else
    puts "Please try again"
  end
end

stop = " "
until (dc_metro[stop_key].include?(stop))
  print "Please enter the stop you will arrive at: "
  stop = gets.chomp
end

start_num = dc_metro[start_key].index(start)
stopNum = dc_metro[stop_key].index(stop)

if (start_line != stop_line)
  start_num = ((start_num - dc_metro[start_key].index("Metro Center")).abs)
  stopNum = ((stopNum - dc_metro[stop_key].index("Metro Center")).abs)
  puts "\nYou will travel #{(stopNum+start_num)} stops"
else
  puts "\nYou will travel #{((stopNum-start_num).abs)} stops"
end







