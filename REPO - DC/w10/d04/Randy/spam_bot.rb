require 'HTTParty'
require 'pry'


def retrieve_emails(site)
  pattern = /([^":]\w+@+\w.+(com|edu|org))/i
  site_info = HTTParty.get(site)
  emailArray = site_info.scan(pattern)

  emailArray.each do |email|
    puts email
  end


end


retrieve_emails("http://andrewmadden.com")
