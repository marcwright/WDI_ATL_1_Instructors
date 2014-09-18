class Basket < Array
  attr_writer :calculated_price

  def amount_of_product(product)
    select { |matching_product| matching_product.code == product.code }.size
  end

  def calculated_price
#    @calculated_price ||= inject(0) { |memo, product| memo += product.calculated_price;puts "#{product.object_id}:#{product.code} #{product.calculated_price}";memo } # used while debugging the failure (which turned out to be the wrong expected price in test 1)
    @calculated_price ||= inject(0) { |memo, product| memo += product.calculated_price }
  end
end
