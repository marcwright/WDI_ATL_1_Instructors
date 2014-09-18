require 'HTTParty'

# takes arguments passed in the command line, like so:
# $ weather.rb "city" "state"
city = ARGV[0]
state = ARGV[1]

city = city.gsub /\s/, '_'

response = HTTParty.get("http://api.wunderground.com/api/cc72fc48b0cc761e/conditions/q/#{state}/#{city}.json")

# puts "THE CURRENT TEMPERATURE IN #{city.upcase},#{state.upcase} IS: #{response['current_observation']['temp_f']} DEGREES F"

puts "THE CURRENT TEMPERATURE IN HELL IS: #{response['current_observation']['temp_c'].to_i}#{response['current_observation']['temp_f'].to_i} DEGREES F"


hourly_response = HTTParty.get("http://api.wunderground.com/api/cc72fc48b0cc761e/hourly/q/#{state}/#{city}.json")

hourly_response["hourly_forecast"].each do |hour|
  puts "#{hour["FCTTIME"]["civil"]} TEMP WILL BE #{hour["temp"]["english"]} DEGREES F; CONDITION WILL BE #{hour["condition"].upcase}."
end



# puts hourly_response["hourly_forecast"][0]["temp"]["english"]
