#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-19 16:56:45
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-19 17:03:29

def is_prime(x)
  (2..(x-1)).each do |num|
    return false if x % num == 0
  end

  return true
end

puts is_prime(13)
puts is_prime(8)
