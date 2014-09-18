class Checkout
  def initialize(promotions)
    @basket = Basket.new
    @promotions = promotions.group_by(&:class)
  end

  def scan(product)
    @basket << product.clone
  end

  def total
    [UnitPricePromotion, BogofPromotion].each do |promotion_type|
      (@promotions[promotion_type] || []).each do |promotion|
        promotion.apply(@basket)
      end
    end

    # this is a candidate for a bit more work - if there's more than one TotalPricePromotion, what to do? Apply them all?! Or the last one the subtotal exceeds the threshold price of? Needs a bit of clarification...
    (@promotions[TotalPricePromotion] || []).each do |promotion|
      promotion.apply(@basket)
    end

    (@basket.calculated_price * 100).round / 100.0
  end

end
