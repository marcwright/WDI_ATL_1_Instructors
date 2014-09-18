class Change
  attr_accessor :coins

  def self.make_change(amount)
    quarters = 0
    dimes = 0
    nickels = 0
    pennies = 0

    while amount >= 25
      amount -= 25
      quarters +=1
    end

    while amount >= 10
      amount -= 10
      dimes +=1
    end

    while amount >= 5
      amount -= 5
      nickels +=1
    end

    while amount >= 1
      amount -= 1
      pennies +=1
    end

    @coins = []
    if quarters == 1
      @coins.push("1 quarter")
    elsif quarters > 1
      @coins.push("#{quarters} quarters")
    end

    if dimes == 1
      @coins.push("1 dime")
    elsif dimes > 1
      @coins.push("#{dimes} dimes")
    end

    if nickels == 1
      @coins.push("1 nickel")
    elsif nickels > 1
      @coins.push("#{nickels} nickels")
    end

    if pennies == 1
      @coins.push("1 penny")
    elsif pennies > 1
      @coins.push("#{pennies} pennies")
    end

    return @coins.join(", ")
  end
end
