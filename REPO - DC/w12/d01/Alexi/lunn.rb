require 'pry'

# 4408 0412 3456 7893

class Lunn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def array
    number.gsub(/\W/, '').split(//).reverse
  end

  def integer
    array.map do |odd|
      odd.to_i
    end
  end

  def double
    binding.pry
    integer.map do |odd|
      odd * 2 if (odd + 1) % 2 == 0
    end
  end

  def sum_array 
    if (double.reduce % 10) == 0
      return true
    end
  end

end # END of class

cc_num = Lunn.new('4408 0412 3456 7893')
puts cc_num.sum_array
