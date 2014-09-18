# Stephen Stanwood (stephen@stanwoodsolutions.com)

class Calculator
  def add(x, y)
    x + y
  end

  def subtract(x, y)
    x - y
  end

  def power(x, y)
    x ** y
  end

  def sum(arr)
    arr.reduce(0, :+)
  end

  # Accepts either two numbers or an array of several & multiplies them.
  def multiply(*nums)
    nums.reduce(1, :*)
  end

  # Calculates the factorial of a given number
  def factorial(x)
    return nil if x < 0
    return 1 if x < 2
    x * factorial(x-1)
  end

  # Identifies the greatest common divisor for two integers
  def gcd(x,y)
    return x.gcd(y)
  end
end
