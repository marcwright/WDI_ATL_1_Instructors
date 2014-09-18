class Promotion
  def initialize(*attrs)
    raise "needs to be overloaded"
  end

  def apply(basket)
    raise "needs to be overloaded"
  end
end
