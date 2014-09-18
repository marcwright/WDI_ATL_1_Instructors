#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 09:04:23
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 10:05:07

COINS = [ :quarters, :dimes, :nickels, :pennies ]
COIN_VALUES = { quarters: 25, dimes: 10, nickels: 5, pennies: 1 }

# Makes change with the fewest number of coins for a specified # of cents
def makechange(cents)
  return "Enter a positive integer!" if cents.to_i != cents || cents < 0

  change = { quarters: 0, dimes: 0, nickels: 0, pennies: 0 }

  COINS.each do |coin|
    change[coin] += cents / COIN_VALUES[coin]
    cents %= COIN_VALUES[coin]
  end

  return change
end
