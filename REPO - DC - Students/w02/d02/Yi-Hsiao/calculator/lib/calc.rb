class Calculator
  def add(addend_1, addend_2)
    addend_1 + addend_2
  end

  def subtract(minuend, subtrahend)
    minuend - subtrahend
  end

  def power(base, exponent)
    base ** exponent
  end

  def sum(nums)
    nums.reduce(0, :+)
  end

  def multiply(*factors)
    factors.reduce(:*)
  end

  def factorial(num)
    (1..num).reduce(:*) || 1
  end
end
