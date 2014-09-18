require 'pry'

class Changer
  attr_reader :coins
  attr_accessor :change

  def initialize(coins)
    @coins = coins
    @change = {quarters: nil, dimes: nil, nickles: nil, pennies: nil}
  end

  def make_change
    if @coins.class != Fixnum
      return "Please enter a number!"
    else
      @change[:quarters] = @coins/25
      @coins -= (@change[:quarters]*25)

      @change[:dimes] = @coins/10
      @coins -= (@change[:dimes]*10)

      @change[:nickles] = @coins/5
      @coins -= (@change[:nickles]*5)

      @change[:pennies] = @coins

    end
  end
end
