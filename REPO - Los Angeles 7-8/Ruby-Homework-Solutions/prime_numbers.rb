# guess what - there's a class for that!

=begin
require 'prime'

def primes n
  Prime.take(n)
end
=end

def primes n
  primes = []
  val = 2
  while primes.count < n
    primes.push(val) if prime? val
    val += 1
  end
  return primes
end

def prime? val
  return true if val == 2 || val == 3
  return false if val.even?
  (3..Math.sqrt(val)).to_a.each { |x| return false if val % x == 0 }
  return true
end
