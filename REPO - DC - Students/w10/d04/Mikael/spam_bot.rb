require 'HTTParty'

def retrieve_emails(url)

  response = HTTParty.get(url)

  emails = response.scan(/\w+@\w+\.\w{3}/i)

end
