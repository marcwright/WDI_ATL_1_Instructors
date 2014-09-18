

class Calculator

  def add(num1, num2)
    return (num1 + num2)
  end

  def subtract(num1, num2)
    return (num1 - num2)
  end

  def power(num1, num2)
    return (num1 ** num2)
  end

  def sum(arry)
    return arry.reduce(0, :+)
  end

  def multiply(*nums)
    return nums.reduce(:*)
  end

  def factorial(num)
    return (1..num).reduce(:*) || 1
  end

end
