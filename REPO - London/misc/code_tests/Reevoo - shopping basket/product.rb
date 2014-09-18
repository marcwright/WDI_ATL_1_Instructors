class Product
  attr_reader :code, :name, :price
  attr_accessor :calculated_price

  def initialize(code, name, price)
    @code, @name, @price = code, name, price
    @calculated_price = price
  end
end
