class Calculator

  def add(num1, num2)
    return num1 + num2
  end

  def subtract(num1, num2)
    return num1 - num2
  end

  def power(num1, num2)
    return num1 ** num2
  end

  def sum(array)
    return array.inject(:+)
  end

  def multiply(*nums)
    return nums.reduce(:*)
  end

  def factorial(num)
    if num
    return num.downto(1).reduce(:*)
  end

end
