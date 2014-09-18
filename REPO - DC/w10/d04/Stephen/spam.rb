require 'HTTParty'
require 'pry'

response = HTTParty.get(ARGV[0])
valid_email = /^.+@.+$/

res = response.scan(valid_email)
binding.pry
