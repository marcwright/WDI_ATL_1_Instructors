
require 'HTTParty'
require 'pry'


current_response = HTTParty.get("http://api.wunderground.com/api/ee23502746751f9f/conditions/q/#{ARGV[1]}/#{ARGV[0].gsub(" ","_")}.json")

puts "CURRENT TEMPERATURE IS: " + current_response['current_observation']['temperature_string']


hourly_response = HTTParty.get("http://api.wunderground.com/api/ee23502746751f9f/hourly/q/#{ARGV[1]}/#{ARGV[0].gsub(" ","_")}.json")

hourly_response["hourly_forecast"].each_with_index do |hour,index|
  if((index + 1) % 3 == 0)
    puts hour["FCTTIME"]["civil"] + " : " + hour["temp"]["english"] + " degrees F and " + hour["condition"]
  end
end
