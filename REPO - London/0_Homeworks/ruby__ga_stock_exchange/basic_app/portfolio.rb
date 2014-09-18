require_relative 'stock'

class Portfolio
  attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
  end

  def buy_stock(symbol, shares, price)
    if stocks[symbol].nil?
      stocks[symbol] = Stock.new(symbol, shares, price)
    else
      stocks[symbol].buy(shares, price)
    end
  end

  def sell_stock(symbol, shares, price)
    stocks[symbol].sell(shares, price) if @stocks[symbol]
  end

  def position
    # stocks.values.map{|stock| stock.position}.reduce{|running_total, value| running_total + value }
    stocks.values.map(&:position).reduce(:+)
  end

  def pretty_print
    "#{name} has #{stocks.count} stocks worth $#{position.round}"
  end
end