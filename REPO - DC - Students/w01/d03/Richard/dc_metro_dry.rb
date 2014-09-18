require 'pry'
class metro
@red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
@turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
@orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

# def dist_from_metro(line)
#   line.each_with_index do |stop, index|
# end

# red_hash =
# {
#     'Woodley Park' =>  3,
#     'Dupont Circle' => 2,
#     'Farragut North' => 1,
#     'Metro Center'=> 0,
#     'Judiciary Square' => 1,
#     'Union Station' => 2
# }
# puts red_hash.each {|key, value| puts [key, value]}

dc_metro = {}
dc_metro[:red] = @red
dc_metro[:turquoise] = @turquoise
dc_metro[:orange] = @orange

def cap(string)
  string.split(" ").map(&:capitalize).join(" ")
end

def color_line
  colors = ["Red", "Turquoise", "Orange"]
  colors.each {|n| puts n}
end

def entry_stop
  puts "Which Metro stop are you at?"
  stop = cap(gets.chomp)
  return
end

def entry_line (entry)
  puts "Which Metro Station?"
  first_stop = cap(gets.chomp)
end
#colors = ["Red", "Turquoise", "Orange"]
#colors.each {|n| puts n}

color_line
puts "Which Metro line would you like to get on?"
entry = gets.chomp.downcase
entry_line(entry)

  if entry_line == "red"
    red.each {|i| puts i}
    entry_stop
    put stop
  elsif entry_line == "turquoise"
    turquoise.each {|i| puts i}
    puts "Which Metro stop are you at?"
    stop = gets.chomp
    stop = cap(stop)
  else
    orange.each {|i| puts i}
    puts "Which Metro stop are you at?"
    stop = gets.chomp
    stop = cap(stop)
  end

color_line
puts "Which Metro line would you like to end up on?"
dest_line = gets.chomp.downcase
puts "What is your destination?"
if dest_line == "red"
    red.each {|i| puts i}
    puts "Which Metro stop are you at?"
    dest = gets.chomp
    dest = cap(dest)
  elsif dest_line == "Turquoise"
    turquoise.each {|i| puts i}
    puts "Which Metro stop are you at?"
    dest = gets.chomp
    dest = cap(dest)
  else
    orange.each {|i| puts i}
    puts "Which Metro stop are you at?"
    dest = gets.chomp
    dest = cap(dest)
  end

  if entry_line == dest_line
  stops = (dc_metro[:red].index(stop).to_i - dc_metro[:red].index(dest).to_i).abs

  elsif entry_line == 'red' || entry_line == 'orange' && dest_line == 'orange' || dest_line =='red'

    stops = (dc_metro[:red].index(stop).to_i - dc_metro[:red].index("Metro Center").to_i).abs + (dc_metro[:orange].index("Metro Center").to_i - dc_metro[:orange].index(dest).to_i).abs

  elsif entry_line == 'red' || entry_line == 'turquoise' && dest_line == 'turquoise' || dest_line =='red'

    stops = (dc_metro[:red].index(stop).to_i - dc_metro[:red].index("Metro Center").to_i).abs + (dc_metro[:turquoise].index("Metro Center").to_i - dc_metro[:turquoise].index(dest).to_i).abs

  else

        stops = (dc_metro[:turquoise].index(stop).to_i - dc_metro[:turquoise].index("Metro Center").to_i).abs + (dc_metro[:orange].index("Metro Center").to_i - dc_metro[:orange].index(dest).to_i).abs
end
end
puts "There are #{stops} stops between #{stop} and #{dest}."
