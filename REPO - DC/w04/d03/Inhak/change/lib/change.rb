class Change
  attr_accessor :cents

  def initialize(cents)
    @cents = cents
    @change = {quarters: 0, dimes: 0, nickels: 0, pennies: 0}
  end

  def make_change
    while @cents > 0
      if @cents > 25
        @change[:quarters] = @cents/25
        @cents %= 25
      elsif @cents < 25 && @cents > 10
        @change[:dimes] = @cents/10
        @cents %= 10
      elsif @cents < 10 && @cents > 5
        @change[:nickels] = @cents/5
        @cents %= 5
      else
        @change[:pennies] = @cents
        @cents = 0
      end
    end
    return @change
  end
end
