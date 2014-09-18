require 'open-uri'
require 'json'

city = ARGV[0].gsub(" ", "_")
state = ARGV[1]

  open('http://api.wunderground.com/api/0d6ebdd664ed341f/geolookup/conditions/q/' + state + '/' + city + '.json') do |f|
    json_string = f.read
    parsed_json = JSON.parse(json_string)
    location = parsed_json['location']['city']
    temp_f = parsed_json['current_observation']['temp_f']
    print "Current temperature in #{location} is: #{temp_f}\n"
  end
  open('http://api.wunderground.com/api/0d6ebdd664ed341f/geolookup/hourly/q/' + state + '/' + city + '.json') do |f|
    json_string = f.read
    parsed_json = JSON.parse(json_string)
    hourly = parsed_json['hourly_forecast']
    i = 0
    hourly.each do |f|
      if i % 3 == 0
        puts "#{f['FCTTIME']['civil']} : #{f['temp']['english']} degrees F, expected to be #{f['condition']}"
      end
      i += 1
    end
  end
