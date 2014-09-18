require_relative '../lib/sku'

describe Sku do
  let (:sku) { Sku.new("1", "Coke", 1.50, 2) }

  describe "::new" do
    it "should set the provided product code, product, price, and quantity." do
      expect( sku.code ).to eq "1"
      expect( sku.product ).to eq "Coke"
      expect( sku.price ).to eq(1.5)
      expect( sku.quantity ).to eq(2)
    end
  end

  describe "#purchase" do
    it "should decrease its available quantity by one" do
      expect( sku.purchase ).to eq(1)
    end

  end
end
