## Partner Activity - ZIP Code
# Partner up and take a stab at writing a ruby method, `is_valid_zip`, that validates a user-submitted ZIP Code, keeping in mind that ZIP codes can be 5 digits, as in 20008, or 5 digits followed by a dash and four more digits, as in 90210-0876. Anything else is invalid, and should result in the method returning false.

def is_valid_zip(zip)

  pattern = /\A[0-9]{5}(-[0-9]{4})?/
  return !pattern.match(zip).nil?

end

puts is_valid_zip('abc')
puts is_valid_zip('20002')
puts is_valid_zip('20002-4432')
puts is_valid_zip('333')
