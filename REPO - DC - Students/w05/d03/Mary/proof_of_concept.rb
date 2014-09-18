require 'httparty'
require 'pry'

googlemaps_response = HTTParty.get("https://www.google.com/maps/embed/v1/directions?key=API_KEY&origin=Atlanta,Georgia&destination=Washington,DC")

flightlookup_response = HTTParty.get('https://flightlookup-timetable-rest.p.mashape.com/TimeTable/BOS/LAX/12/31/2012/?Airline=AA&Hops=NONSTOP&Count=10&EndDate=1%2F30%2F2013&Interline=Y&SortOrder=0')

rottentomatoes_response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=[your_api_key]&limit=10")

rottentomatoes2_response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies/770672122/clips.json?apikey=[your_api_key]")

binding.pry

