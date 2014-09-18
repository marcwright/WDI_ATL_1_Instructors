## Code for shopping basket functionality
##  Run from the command line "ruby test.rb"...

require_relative 'basket'
require_relative 'checkout'
require_relative 'product'
require_relative 'promotion'
require_relative 'unit_price_promotion'
require_relative 'bogof_promotion'
require_relative 'total_price_promotion'
require 'pry'

# binding.pry

## Code for code-test test cases - product prices and promotional offers
products = {
            "FR1" => Product.new("FR1", "Fruit tea", 3.11),
            "SR1" => Product.new("SR1", "Strawberries", 5.00),
            "CF1" => Product.new("CF1", "Coffee", 11.23)
           }

# TotalPricePromotion.new { |basket| basket.calculated_price *= 0.9 if basket.calculated_price > 60.00 } # The FD told me to take the 10% discount promotion out...
promotional_rules = [
                      BogofPromotion.new("FR1"),
                      UnitPricePromotion.new("SR1") { |product, basket| product.calculated_price = 4.5 if basket.amount_of_product(product) > 2 },
                    ]


def basket_test(products, promotional_rules, basket_products, expected_price)
  puts "# Basket: #{basket_products.join(", ")}"
  puts "# Total price expected: #{expected_price}"
  co = Checkout.new(promotional_rules);
  basket_products.each do |product|
    co.scan(products[product]);
  end
  puts "calculated total: #{co.total}"
  puts (co.total == expected_price ? "passed" : "FAILED!")
  puts
end

puts "# Test 1"
basket_test(products, promotional_rules, %w(FR1 SR1 FR1 CF1), 22.25) # This is wrong... the expected price should be £19.34 - since one of the FR1's is free, it should be 5+3.11+11.23... =19.34 (but I've left it as 22.25, since that's what the example asks for...

puts "# Test 2"
basket_test(products, promotional_rules, %w(FR1 FR1), 3.11)

puts "# Test 3"
basket_test(products, promotional_rules, %w(SR1 SR1 FR1 SR1), 16.61)


