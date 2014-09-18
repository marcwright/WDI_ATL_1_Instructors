class Calculator

  def add(x, y)
    return x.to_i + y.to_i
  end

  def subtract(x, y)
    return x.to_i - y.to_i
  end

  def power(x, y)
    return x ** y
  end

  def sum(array)
    return array.reduce(0, :+)
  end

  def multiply(*nums)
    return nums.reduce(:*)
  end

  def factorial(num)
    return 1 if num < 2
    return num * factorial(num - 1)
  end

end
