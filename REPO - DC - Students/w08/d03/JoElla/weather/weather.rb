require 'pry'
require 'HTTParty'

city = ARGV[0].gsub(' ', '_')
state = ARGV[1]

response = HTTParty.get('http://api.wunderground.com/api/36daa460f380d392/conditions/q/' + state + '/' + city + '.json')

temp = response["current_observation"]["temp_f"]

puts "The current temp in #{city}, #{state} is #{temp}."



