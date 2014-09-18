class TotalPricePromotion < Promotion
  def initialize(&promotion)
    @promotion = promotion
  end

  def apply(basket)
    @promotion.call(basket)
  end
end
