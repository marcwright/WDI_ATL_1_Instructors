class Calculator
  def initialize
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

  def multiply(array)
    return array.reduce(0, :*)
  end

  def factorial(num)
    if num == 0 || num == 1
      product = 1
    else
      product = num
      while num > 1
        product = product *(num-1)
        num -= 1
      end
    end
    return product
  end
end
