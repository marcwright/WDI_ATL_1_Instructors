require_relative '../lib/sku'

describe Sku do
  let (:sku) {Sku.new("1", "Coke", 1.50, 2)}

  describe "::new" do
    it "should set the provided product code." do
      expect( sku.code ).to eq "1"
    end
    it "should set the provided product name" do
      expect( sku.product ).to eq( "Coke" )
    end
    it "should set the provided price" do
      expect( sku.price ).to eq( 1.50 )
    end
    it "should set the provided quantity" do
      expect( sku.quantity ).to eq( 2 )
    end
  end # - END ::new

  describe "#purchase" do
    it "should reduce inventory by purchase quantity" do
      sku.purchase
      expect( sku.quantity ).to eq( 1 )
    end
  end # - END purchase method

  

end # - END Sku class
