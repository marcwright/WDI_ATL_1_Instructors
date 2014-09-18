class Change

  attr_accessor :money

  def initialize(money)
    @money = money
    @money_hash = {quarters: 0,
                  dimes: 0,
                  nickels: 0,
                  pennies: 0}
  end


  def make_change

    # @money_hash[:quarters] = @money / 25
    # @money %= 25

    # @money_hash[:dimes] = @money / 10
    # @money %= 10

    # @money_hash[:quarters] = @money / 25
    # @money %= 25

    while @money >= 0.01
      if @money > 0.25
        @money_hash[:quarters] += 1
        @money = @money - 0.25
      elsif @money > 0.10 && @money < 0.25
        @money_hash[:dimes] += 1
        @money = @money - 0.10
      elsif @money > 0.05 && @money < 0.10
        @money_hash[:nickels] += 1
        @money = @money - 0.05
      elsif @money < 0.05
        @money_hash[:pennies] += 1
        @money = @money - 0.01
      else
        @money = 0.00
      end
    end
    @money_hash
  end
end
