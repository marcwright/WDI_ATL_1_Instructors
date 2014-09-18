class Calculator

  def initiate

  end

  def add(num1, num2)
    return num1 + num2
  end

  def subtract(num1, num2)
    return num1 - num2
  end

  def power(num1, num2)
    return num1**num2
  end

  def sum(array)
    return array.reduce(0, :+)
  end

  def multiply(*nums)
    return nums.reduce(:*)
  end

  def factorial(n1)
    if n1 == 1 or n1 == 0
      return 1
    else
      n1*factorial(n1-1)
    end
    return
  end

end
