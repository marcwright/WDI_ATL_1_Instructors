class Calculator
  # def initialize
  #   @value1 = value1
  #   @value2 = value2
  # end

  def add(value1, value2)
    return value1 + value2
  end

  def subtract(value1, value2)
    return value1 - value2
  end

  def power(value1, value2)
    return value1 ** value2
  end

  def sum(array)
    # uses 0 as beginning value when reducing; solves problem of sum of empty array returning nil
    return array.reduce(0, :+)
  end

  def multiply(*values)
    return values.reduce(:*)
  end

  def factorial(num)
    return 1 if num < 2
    1.upto(num).inject(:*)
  end

  def greatest_common_divisor(value1,value2)
    return value1.gcd(value2)
  end
end
