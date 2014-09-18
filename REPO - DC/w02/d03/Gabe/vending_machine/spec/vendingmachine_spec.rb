require_relative '../lib/sku'
require_relative '../lib/vendingmachine'

describe VendingMachine do
  let(:vm) do
    VendingMachine.new([
      Sku.new('slot1', 'Coke', 1.50, 5),
      Sku.new('slot2', 'Diet Coke', 1.50, 0),
      Sku.new('slot3')
    ])
  end

  describe "#get_sku" do
    it "should return an SKU object for a valid numeric code input." do
      sku = vm.get_sku('slot1')
      expect( sku.code).to eq("slot1")
    end
   end

   describe "#get_sku" do
    it "should return nil for an invalid numeric code input." do
      expect( vm.get_sku(99) ).to eq nil
    end
   end

   describe "#insert_cash" do
    it "should add credit to the machine." do
    	vm.insert_cash(5.00)
      expect( vm.credit ).to eq 5.00
    end
   end

   describe "#insert_cash" do
    it "should add credit to exisiting credit on the machine." do
    	vm.insert_cash(1.00)
    	vm.insert_cash(5.00)
      expect( vm.credit ).to eq 6.00
    end
   end

   describe "#enter_code" do
    it "should set the code state;" do
    	vm.enter_code(2)
      expect( vm.code ).to eq 2
    end
   end
  
  	describe "#refund" do
    it "should cancel all credit;" do
    	vm.insert_cash(5.00)
    	vm.refund
      expect( vm.credit ).to eq 0
    end
   end

   describe "#refund" do
    it "should return all previous credit as change;" do
    	vm.insert_cash(5.00)
    	vm.refund
      expect( vm.change ).to eq 5.00
    end
   end

   describe "#refund" do
    it "should return new change to existing change;" do
    	vm.insert_cash(5.00)
    	vm.refund
    	vm.insert_cash(1.00)
    	vm.refund
      expect( vm.change ).to eq 6.00
    end
   end

   describe "#refund" do
    it "should clear the code state;" do
    	vm.enter_code(2)
    	vm.refund
      expect( vm.code ).to eq nil
    end
   end

   describe "#refund" do
    it "should clear the status message;" do
    	vm.refund
      expect( vm.status ).to eq nil
    end
   end

   describe "#vend" do
    it "When INVALID sku is entered, display message for invalid code;" do
      vm.enter_code(77)
      vm.vend
      expect( vm.status).to eq("invalid SKU code; choose again.")
    end
   end

    describe "#vend" do
    it "When INVALID sku is entered, clears the code state;" do
      vm.enter_code(77)
      vm.vend
      expect( vm.code).to eq nil
    end
   end

    describe "#vend" do
    it "When OUT OF STOCK sku is entered, disp. message for out of stock;" do
      vm.enter_code(2)
      vm.vend
      expect( vm.status).to eq("Item out of stock! Please choose again.")
    end
   end

   describe "#vend" do
    it "When OUT OF STOCK sku is entered, clears the code state;" do
      vm.enter_code(2)
      vm.vend
      expect( vm.code).to eq nil
    end
   end

   

    describe "#vend" do
    it "When VALID sku is entered, but too few credits, disp. message for out of stock;" do
      vm.insert_cash(1)
      vm.enter_code(1)
      vm.vend
      expect( vm.status).to eq("Need more credits")
    end
   end



end