require 'HTTParty'
require 'pry'

binding.pry
scrape = HTTParty.get('http://andrewmadden.com')

