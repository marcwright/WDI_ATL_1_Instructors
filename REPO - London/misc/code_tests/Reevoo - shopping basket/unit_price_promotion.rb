class UnitPricePromotion < Promotion
  def initialize(product_code, &promotion)
    @product_code, @promotion = product_code, promotion
  end

  def apply(basket)
    basket.select { |product| product.code == @product_code }.each do |product|
      @promotion.call(product, basket)
    end
  end
end
