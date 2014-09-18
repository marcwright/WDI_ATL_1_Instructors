class Calculator
  def add(num_1, num_2)
    return num_1 + num_2
  end

  def subtract(num_1, num_2)
    return num_1 - num_2
  end

  def power(num_1, num_2)
    return num_1**num_2
  end

  def sum(array)
    sum = array.reduce(0, :+)
    return sum
  end

  def multiply(*nums)
    product = nums.reduce(1, :*)
    return product
  end

  def factorial(num)
    if num == 0
      return 1
    else
      return num.downto(1).inject(:*)
    end
  end
end
