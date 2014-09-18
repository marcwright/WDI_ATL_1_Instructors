require 'ruby-prof'
# Profile the code
RubyProf.start

#*** fib returns the nth element in the sequence, not the whole sequence up to n ***

# STEP 1: Let the class write the iterative version
def fib(n)
  if n < 2
    n
  else
    num1, num2 = 0,1
    while n > 1 #since the 0 and 1 steps were already done for the n<2 case
    n-=1
    num2 = num1 + num1 = num2 #as in: num2 = old_num1 + (num1 = old_num2, returns old_num2)
    puts "#{num1}, #{num2}"
    # OR
    # tmp = num2
    # num2 += num1
    # num1 = tmp
    end
    num2
  end
end

# STEP 2: Investigate the method calls in:
# 10.times do |i|
#   x = fib(i)
#   puts "#{i}: #{x}"
# end


result = RubyProf.stop

# Print a flat profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)

# STEP 3: Identify the self-similar component (A: fib(n) is fib(n-1) + fib(n-2), this is a multiple recursion)

# STEP 4: Identify the base case (A: when n < 2 we can return n as is)

# STEP 5: Discuss implementation

def fib_r(n)
  n < 2 ? n : fib_r(n-1)+fib_r(n-2)
end

# STEP 6: Investigate the method calls in:
# 10.times do |i|
#   x = fib(i)
#   puts "#{i}: #{x}"
# end


# def fib_pav(start=0, max=5)
def fib_pav(max)
  previous = []
  (0..max).each do |val|
    previous[val] ||= case val
    when 0, 1
      val
    else
      previous[val-2] + previous[val-1]
    end
  end
  # puts (start..max).map{|val| previous[val]}.inspect
  previous.last
end

# 10.times do |i|
#   x = fib_pav(i)
#   puts "#{i}: #{x}"
# end






