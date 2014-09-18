require 'pry'
require 'httparty'

location = [];

city = ARGV[0].tr(" ", "_")
state = ARGV[1].upcase

response = HTTParty.get("http://api.wunderground.com/api/d4dca58bca90b456/conditions/q/#{state}/#{city}.json")

puts ""

temp = response["current_observation"]["temp_f"]

puts "THE CURRENT TEMPERATURE IS: #{temp} DEGREES F"

puts ""

response_hourly = HTTParty.get("http://api.wunderground.com/api/d4dca58bca90b456/hourly/q/#{state}/#{city}.json")

counter = 2

response_hourly["hourly_forecast"].each do |hour|
  counter +=1
  if counter % 3 == 0
    puts hour["FCTTIME"]["civil"] + " : " + hour["temp"]["english"] + " degrees F" + " Condition: " + hour["condition"]
  end
end


# binding.pry
