class Sku
  #attr_reader builds getters for symbols that map to instance variables; attr_writer does the same for setters; attr_accessor builds both getters & setters
  attr_accessor :code, :product, :price, :quantity

  def initialize(code, product='', price=0, quantity=0)
    @code = code
    @product = product
    @price = price
    @quantity = quantity
  end

  def purchase
    @quantity -= 1
  end

end
