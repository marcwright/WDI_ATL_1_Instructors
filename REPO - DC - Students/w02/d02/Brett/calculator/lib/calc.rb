class Calculator

  def add(num_1, num_2)
    return num_1 + num_2
  end

  def subtract(num_1, num_2)
    return num_1 - num_2
  end

  def power (num_1, num_2)
    return num_1 ** num_2
  end

  def sum (array)
    return array.reduce(0, :+)
  end

  def multiply(*nums)
    return nums.reduce(:*)
  end

  def factorial(num_1)
    return (1..num_1).reduce(:*) || 1
  end

end
