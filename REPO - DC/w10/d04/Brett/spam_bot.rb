require 'HTTParty'

def retrieve_emails(url)

  document = HTTParty.get(url)

  pattern = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i

end
