require 'pry'
require 'httparty'

puts "Enter a location."
location = gets.chomp.gsub(" ", "+")

response = HTTParty.get("https://george-vustrey-weather.p.mashape.com/api.php?location=#{location}",
  headers: {
    "X-Mashape-Authorization" => "OpHOxap9vfNlTwibvlGHiv6qCOngJR67"
  })
# response_hash = JSON(response)

puts ""
puts "Tomorrow's forecast: #{response[1]["condition"]}"
puts "Tomorrow will have a high of #{response[1]["high"]} degrees Fahrenheit."
