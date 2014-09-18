require 'httparty'
require 'pry'


# Seatgeek API
events = []
seatgeek_response = HTTParty.get("http://api.seatgeek.com/2/events?venue.city=washington&type=concert&per_page=100")["events"]
seatgeek_response.map do |event|
  events << event
end

events.each do |event|
  puts "#{event["title"]} at #{event["venue"]["name"]} on #{event["datetime_local"]}"
end
  binding.pry
