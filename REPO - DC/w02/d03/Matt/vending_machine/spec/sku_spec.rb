require_relative '../lib/sku'

describe Sku do
  let (:sku) { Sku.new("1", "Coke", 1.50, 2) }

  # test initialization
  describe "::new" do
    it "should set the provided product code." do
      expect( sku.code ).to eq "1"
    end

    it "should set the product name to" do
      expect( sku.product ).to eq("Coke")
    end

    it "should set the product price to" do
      expect( sku.price ).to eq(1.50)
    end

    it "should set the product quantity to" do
      expect( sku.quantity ).to eq(2)
    end
    # Keep going...!

  end

  # test removing 1 item from available stock
  describe "#purchase" do

    it "should decrease its available quantity by 1" do
      sku.purchase
      expect( sku.quantity ).to be 1
    end

  end

end
