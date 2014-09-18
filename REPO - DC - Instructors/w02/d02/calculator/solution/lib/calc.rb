class Calculator
  def add(a, b)
    return a + b
  end

  def subtract(a, b)
    return a - b 
  end

  def power(a, b)
    return a ** b
  end

  def sum(num_array)
    return num_array.reduce(0, :+)
  end

  def multiply(*numbers)
    return numbers.reduce(:*)
  end

  def factorial(number)
    return 1 if number == 0
    return 1.upto(number).reduce(:*)
  end
end