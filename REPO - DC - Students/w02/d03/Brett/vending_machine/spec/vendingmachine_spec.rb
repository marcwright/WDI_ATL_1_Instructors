require_relative '../lib/sku'
require_relative '../lib/vendingmachine'

describe VendingMachine do
  let(:vm) do
    VendingMachine.new([
      Sku.new("1", 'Coke', 1.50, 5),
      Sku.new("2", 'Diet Coke', 1.50, 0),
      Sku.new("3")
    ])
  end

  describe "#get_sku" do
    it "should return a Sku object for a valid code" do
      expect( vm.get_sku('1') ).to eq( vm.inventory[0] )
    end
    it "should return nil for an invalid code" do
      expect( vm.get_sku('5') ).to eq(nil)
  end

  describe "#insert_cash!"
    it "should add credit" do
      vm.insert_cash!( 0.25 )
      expect( vm.credit ).to eq( 0.25 )
    end
    it "should add new credit to existing credit" do
      vm.insert_cash!( 0.25 )
      vm.insert_cash!( 0.50 )
      expect( vm.credit ).to eq( 0.75 )
    end
  end

  describe "#enter_code!" do
    it "should set the code state" do
      vm.enter_code!(1)
      expect( vm.code ).to eq( 1 )
    end
  end

  describe "#refund!" do
    it "should cancel all credit" do
      vm.refund!
      expect( vm.credit ).to eq( 0 )
    end
    it "should return all previous credit as change" do
      vm.insert_cash!( 0.50 )
      vm.refund!
      expect( vm.change ).to eq(0.50)
    end
    it "should add new change to existing change" do
      vm.insert_cash!( 0.50 )
      vm.refund!
      vm.insert_cash!( 0.25 )
      vm.refund!
      expect( vm.change ).to eq(0.75)
    end
    it "should clear the code state" do
      vm.enter_code!(1)
      vm.refund!
      expect( vm.code ).to eq("")
    end
    it "should clear status message state" do
      vm.refund!
      expect( vm.status ).to eq("")
    end
  end

  describe "#vend!" do
    context "When entered SKU code is invalid" do
      it "should have status message prompt for a valid code" do
        vm.enter_code!("5")
        vm.vend!
        expect( vm.status ).to eq "Please enter valid code"
      end
      it "should clear the code state" do
        vm.vend!
        expect( vm.code ).to eq ""
      end
    end
    context "When entered SKU code is out of stock" do
      it "should have a status message prompt 'out of stock' status" do
        vm.enter_code!("2")
        vm.vend!
        expect( vm.status ).to eq "Out of stock"
      end
      it "should clear the code state" do
        vm.vend!
        expect( vm.code ).to eq ""
      end
    end
    context "When entered SKU is valid, but credit is insufficient" do
      it "should have status message prompt the user to insert additional cash and should have status message include the required cash amount." do
        vm.enter_code!("1")
        vm.insert_cash!(0.75)
        vm.vend!
        expect( vm.status ).to eq "Insufficient credit. Item costs $1.5"
      end
    end
    context "When entered SKU is valid, and credit is sufficient" do
      it "should decrement the purchased SKU's quantity" do
        vm.enter_code!("1")
        vm.insert_cash!(1.50)
        vm.vend!
        expect( vm.get_sku("1").quantity ).to eq(4)
      end
      it "should deduct the SKU's price from credit before dispensing change" do
        vm.enter_code!("1")
        vm.insert_cash!(2.00)
        vm.vend!
        expect( vm.credit ).to eq(0.50)
      end
      it "should add the purchased product into purchases" do
        vm.enter_code!("1")
        vm.insert_cash!(2.00)
        vm.vend!
        expect( vm.purchases.last ).to eq "Coke"
      end
      it "should add new purchases into existing purchases" do
        vm.enter_code!("1")
        vm.insert_cash!(2.00)
        vm.vend!
        vm.enter_code!("1")
        vm.insert_cash!(2.00)
        vm.vend!
        expect( vm.purchases.length ).to eq(2)
      end
      it "should not remove the item from the inventory" do
        vm.enter_code!("1")
        vm.insert_cash!(2.00)
        vm.vend!
        expect( vm.get_sku("1").product).to eq "Coke"
      end
    end
  end
end
