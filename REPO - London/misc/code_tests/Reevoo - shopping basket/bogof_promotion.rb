class BogofPromotion < Promotion
  def initialize(product_code)
    @product_code = product_code
  end

  def apply(basket)
    products = basket.select { |product| product.code == @product_code }

    products.each_with_index do |product, index|
      product.calculated_price = 0.00 if product.code == @product_code && index.odd?
    end

  end
end
