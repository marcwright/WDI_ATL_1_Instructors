class MoneyChanger
  def initialize
    # a hash of coin currency names and their value
    @coin_currency = {
      quarter: 25,
      dime: 10,
      nickel: 5,
      penny: 1
    }
  end

  def coin_currency
    @coin_currency
  end

  def make_change(num_cents)

    # only give change if there is at least one coin to give
    return if num_cents < coin_currency.values.min

    # ensures that coin currency is sorted from largest to smallest, so we can give change with the least number of coins
    currency_desc_order = Hash[coin_currency.sort_by { |coin_name, coin_value| coin_value }.reverse]
    
    # give the appropriate number of coins for a given change amount
    remaining_change = num_cents.to_i
    coin_change = currency_desc_order.map do |coin_name, coin_value|

      if remaining_change >= coin_value
        num_coins = remaining_change / coin_value
        remaining_change -= num_coins * coin_value
        [coin_name, num_coins]
      end
    end

    Hash[coin_change.compact]  # hash of coins and the number of coins to be given
  end
end