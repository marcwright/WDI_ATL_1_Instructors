require 'HTTParty'

response = HTTParty.get("http://api.wunderground.com/api/cc72fc48b0cc761e/conditions/q/DC/washington.json")

puts "THE CURRENT TEMPERATURE IN HELL IS: #{response['current_observation']['temp_c'].to_i}#{response['current_observation']['temp_f'].to_i} DEGREES F"
