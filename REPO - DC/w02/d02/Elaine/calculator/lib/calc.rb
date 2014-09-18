class Calculator

  def add(number1, number2)
    return number1 + number2
  end

  def subtract(number1, number2)
    return number1 - number2
  end

  def power(number1, number2)
    return number1**number2
  end

  def sum(array)
    return array.reduce(0, :+)
  end

  def multiply(*nums)
    return nums.reduce(:*)
  end

  def factorial(number)
    if number < 2
      return 1
    else
      return number * factorial(number - 1)
    end
  end

end
