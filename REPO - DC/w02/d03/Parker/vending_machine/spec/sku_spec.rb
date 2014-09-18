require_relative '../lib/sku'

describe Sku do 
  let (:code) { code.new("1", "Coke", 1.50, 2) }

  describe "::new" do
    it "should set the provided product code." do
      expect( sku.code ).to eq "Coke"
    end
    
    it "should set the provided product name." do
      expect ( sku.product ).to eq "Code"
    end
    
    it "should set the provided price." do
    	expect ( sku.price ).to eq "1.50"
    end
    
    it "should set the provided quantity." do
    	expect ( sku.quantity ).to eq "2"
    end

	describe "::purchase" do
		it "should decrease its avaliable by one." do
			sku.purchase
			expect (sku.quantity ).to be 1
	end
end



 

