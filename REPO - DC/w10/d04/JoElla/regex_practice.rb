# __Example usage:__
# ```ruby
# retrieve_emails("http://www.andrewmadden.com") # => ['amadden80@gmail.com']
# ```

# ####Directions

# 1. Use HTTParty and RegExp.
# 2. Don't give up.

require 'HTTParty'
require 'pry'

def retrieve_emails(url)
  html = HTTParty.get(url)
  email = /.+\@.+\..+/.match(html)
end

binding.pry

