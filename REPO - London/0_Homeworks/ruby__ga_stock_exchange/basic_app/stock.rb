class Stock
  attr_accessor :symbol, :shares, :price

  def name
    symbol
  end

  def initialize(symbol, shares, price)
    @symbol = symbol
    @shares = shares
    @price = price
  end

  def buy(shares, price)
    self.price = price
    @shares += shares
  end

  def sell(shares, price)
    self.price = price
    @shares -= shares if shares <= @shares
  end

  def position
     price * @shares
  end

  def pretty_print
    "Purchased #{@shares} shares of #{name} (#{@symbol}) worth $#{position.round}"
  end

end
