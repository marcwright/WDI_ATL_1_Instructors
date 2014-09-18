red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

puts ""
puts "Which line do you want to get on?"
puts "\"red\""
puts "\"turquoise\""
puts "\"orange\""

starting_line = gets.chomp.downcase

puts ""
puts "Here are the list of stops on the #{starting_line} line:"

if starting_line == "red"
  puts red.join", "
elsif starting_line == "turquoise"
  puts turquoise.join", "
else
  puts orange.join", "
end

puts ""
puts "Enter the stop you want to get on at."
starting_station = gets.chomp.downcase


puts ""
puts "Which line do you want to get off at? (red/turquoise/orange)"
ending_line = gets.chomp.downcase

puts ""
puts "Here are the list of stops on the #{ending_line} line:"

if ending_line == "red"
  puts red.join", "
elsif ending_line == "turquoise"
  puts turquoise.join", "
else
  puts orange.join", "
end

puts ""
puts "Enter the stop you want to get off at."
ending_station = gets.chomp.downcase

distance_to_center = {
  "woodley park" => 3,
  "dupont circle" => 2,
  "farragut north" => 1,
  "metro center" => 0,
  "judiciary square" => 1,
  "union station" => 2,

  "beltwater" => 2,
  "shaw-howard" => 1,
  "crystal city" => 1,

  "farragut west" => 2,
  "mcpherson square" => 1,
  "federal triangle" => 1,
  "smithsonian" => 2,
  "l'enfant plaza" => 3
}


stops_to_center = distance_to_center[starting_station]
stops_from_center = distance_to_center[ending_station]



total_stops = stops_to_center + stops_from_center

if starting_station == "beltwater" && ending_station == "shaw-howard"
  total_stops = 1
elsif ending_station == "beltwater" && starting_station == "shaw-howard"
  total_stops = 1
elsif starting_station == "woodley park" && ending_station == "dupont circle"
  total stops = 1
elsif ending_station == "woodley park" && starting_station == "dupont circle"
  total_stops = 1
elsif starting_station == "woodley park" && ending_station == "farragut north"
  total_stops = 2
elsif ending_station == "woodley park" && starting_station == "farragut north"
  total_stops = 2
elsif starting_station == "union station" && ending_station == "judiciary square"
  total_stops = 1
elsif ending_station == "union station" && starting_station == "judiciary square"
  total_stops = 1
elsif starting_station == "farragut west" && ending_station == "mcpherson square"
  total_stops = 1
elsif ending_station == "farragut west" && starting_station == "mcpherson square"
  total_stops = 1
elsif starting_station == "l'enfant plaza" && ending_station == "smithsonian"
  total_stops = 1
elsif ending_station == "l'enfant plaza" && starting_station == "smithsonian"
  total_stops = 1
elsif starting_station == "l'enfant plaza" && ending_station == "federal triangle"
  total_stops = 2
elsif ending_station == "l'enfant plaza" && starting_station == "federal triangle"
  total_stops = 2
elsif starting_station == "smithsonian" && ending_station == "federal triangle"
  total_stops = 1
elsif ending_station == "smithsonian" && starting_station == "federal triangle"
  total_stops = 1
elsif starting_station == "farragut north" && ending_station == "dupont circle"
  total_stops = 1
elsif ending_station == "farragut north" && starting_station == "dupont circle"
  total_stops = 1
elsif starting_station == ending_station
  total_stops = 0
end


puts ""
puts "Your trip will have #{total_stops} stop(s)."

