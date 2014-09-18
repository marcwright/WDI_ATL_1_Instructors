require 'pry'

class Change

  def initialize(money)
    @money=money.to_f
    quarters = []
  end

  def return_change
    quarters = money.map do |quarters|
      quarters - 0.25
    end
  end

end
