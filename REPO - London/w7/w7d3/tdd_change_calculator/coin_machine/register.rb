class Register

  def initialize(coins)
    @coins = coins.inject({}) do |memo, (denomination, quantity)|
      memo[denomination] = quantity
      memo
    end
  end

  def coin_denominations
    @coins.keys.sort.reverse
  end

  def make_change(options)
    price = options.fetch(:price)*100
    payment = options.fetch(:payment)*100
    change = calculate_change(payment, price)

    return_value = coin_denominations.inject({}) do |memo, coin_denomination|
      while change >= coin_denomination && @coins.fetch(coin_denomination) > 0
        memo[coin_denomination] ||= 0
        memo[coin_denomination] += 1
        change -= coin_denomination
        @coins[coin_denomination] -= 1
      end
      memo
    end

    raise "can't make change" if change > 0

    return_value
  end

  def calculate_change(payment, price)
    (payment - price).to_i
  end

end