require_relative '../lib/sku'
require_relative '../lib/vendingmachine'

describe VendingMachine do
  let(:vm) do
    VendingMachine.new([
      Sku.new('1', 'Coke', 1.50, 5),
      Sku.new('2', 'Diet Coke', 1.50, 0),
      Sku.new('3')
    ])
  end

  describe "#get_sku" do
    it "should return a Sku object for a valid code" do
      expect( vm.get_sku("1") ).to eq( vm.inventory[0] )
    end
    it "should return *nil* for an invalid code" do
      expect( vm.get_sku("25")).to eq(nil)
    end
  end #-- ends describe #get_sku

  describe "#insert_cash" do
    it "should add credit" do
      expect( vm.insert_cash(1) ).to eq( 1 )
    end
    it "should add new credit to existing credit" do
      vm.credit = 2
      expect( vm.insert_cash(1) ).to eq( 3 )
    end
  end #-- ends describe #insert_cash

  describe "#enter_code" do
    it "should set the code state" do
      expect( vm.enter_code ("2") ).to eq("2")
    end
  end #-- ends describe #enter_code

  describe "#refund" do
    it "should cancel all credit" do
      vm.insert_cash(1)
      vm.refund
      expect( vm.credit ).to eq(0)
    end
    it "should return all previous credit as change" do
      vm.insert_cash(1)
      vm.refund
      expect( vm.change ).to eq(1)
    end
    it "should add new change to existing change" do
      vm.insert_cash(1)
      vm.change = 2
      vm.refund
      expect( vm.change ).to eq(3)
    end
    it "should clear the code state" do
      vm.enter_code(2)
      vm.refund
      expect( vm.code ).to eq(nil)
    end
    it "should clear the status message state" do
      vm.refund
      expect( vm.status ).to eq('')
    end
  end #-- ends describe #refund

  describe "#vend" do
    context "when entered SKU code is invalid" do
      before { vm.enter_code("789") }
      it "should have status message prompt for a valid code" do
        expect( vm.vend ).to eq("Please enter a valid code.")
      end
      it "should clear the code state" do
        vm.vend
        expect( vm.code ).to eq(nil)
      end
    end #--ends context SKU code invalid

    context "when entered SKU code is out of stock" do
      before { vm.enter_code("2") }
      it "should have status message prompt 'out of stock' status" do
        expect( vm.vend ).to eq("This product is out of stock.")
      end
      it "should clear the code state" do
        vm.vend
        expect( vm.code ).to eq(nil)
      end
    end #--ends context when SKU is out of stock

    context "when entered SKU is valid but credit is insufficient" do
      before do
        vm.insert_cash(0.25)
        vm.enter_code("1")
        vm.vend
      end
      it "should have status message prompt the user to insert additional cash" do
        expect( vm.status ).to eq("Insufficient credit; please insert additional funds in amount of 1.25.")
      end
      it "should have status message include the required cash ammount" do
        expect( vm.status ).to eq("Insufficient credit; please insert additional funds in amount of 1.25.")
      end
    end #--ends context SKU is valid but not enough credit

    context "when entered SKU is valid, and credit is sufficient" do
      before do
        vm.insert_cash(2)
        vm.enter_code("1")
        vm.vend
      end
      it "should decrement the purchased SKU's quantity" do
        expect( vm.get_sku("1").quantity ).to eq(4)
      end
      it "should deduct the SKU's price from credit before dispensing change" do
        expect( vm.credit ).to eq(0.5)
      end
      it "should add the purchased product into purchases" do
        expect( vm.purchases[-1] ).to eq("Coke")
      end
      it "should add new purchases into existing purchases" do
        vm.insert_cash(2)
        vm.enter_code("1")
        vm.vend
        expect( vm.purchases ).to eq(["Coke","Coke"])
      end
    end #--ends context SKU is valid and enough change
  end #--ends #vend



end
