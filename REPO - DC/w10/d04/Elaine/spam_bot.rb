require 'pry'
require 'httparty'

def retrieve_emails(url)
  response = HTTParty.get(url)
  response_hash = JSON(response)
  pattern = /([_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4}))/
  string = response.to_s
  string.scan(pattern)
end
