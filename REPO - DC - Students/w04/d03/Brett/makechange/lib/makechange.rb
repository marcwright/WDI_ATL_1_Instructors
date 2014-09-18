require 'pry'

class ChangeMachine
  attr_reader :balance, :coin_count

  def initialize
    @balance = 25
    @coin_count = {
      :quarter => 0,
      :dime => 0,
      :nickel => 0,
      :penny => 0
    }
  end

# subtract each denomination, decreasing with each step

  def make_change
    if @balance - 25 != 0
      @balance -= 25
      @coin_count[quarter] += 1
    end
  else
  end
end
