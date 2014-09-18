require 'pry'
require 'httparty'

ARGV.each do|a|
  puts "Argument: #{a}"
end

city = ARGV[0]
state = ARGV[1]

get_weather = HTTParty.get("http://api.wunderground.com/api/32bdde32c4853d7a/conditions/q/#{state}/#{city}.json")
puts get_weather['current_observation']['temp_f'].to_s + " Degrees Farenheit"
