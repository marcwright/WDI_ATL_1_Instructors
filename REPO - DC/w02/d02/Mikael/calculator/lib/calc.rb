class Calculator

  def add(x, y)
    return x + y
  end

  def subtract(x, y)
    return x - y
  end

  def power(x, y)
    return x ** y
  end

  def sum(array)
    sum = array.reduce(0, :+)
    return sum
  end

  def multiply(*array)
    array.reduce(:*)
  end

  def factorial(val)
    return 1 if val < 2
    return val * factorial(val - 1)
  end
end
