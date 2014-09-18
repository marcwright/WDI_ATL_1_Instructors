require 'pry'

def ip_checker(ip_address)
  pattern = /\A[0-2]{0,1}[0-5]{0,2}\.[0-2]{0,1}[0-5]{0,2}\.[0-2]{0,1}[0-5]{0,2}\.[0-2]{0,1}[0-5]{0,2}\z/
  return true if pattern.match(ip_address)
end

binding.pry
