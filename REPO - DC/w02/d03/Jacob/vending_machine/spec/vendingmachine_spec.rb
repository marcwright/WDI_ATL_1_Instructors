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
      expect(vm.get_sku('2')).to eq(vm.inventory[1])
    end
    it "should return *nil* for an invalid code" do
      expect(vm.get_sku('24')).to eq(nil)
    end
  end

  describe "#insert_cash" do
    it "should add credit" do
      expect(vm.insert_cash(1)).to eq(1)
    end

    it "should add new credit to existing credit" do
      vm.insert_cash(1)
      expect(vm.insert_cash(1)).to eq(2)
    end
  end

  describe "#enter_code" do
    it "should set the code state" do
      vm.enter_code("magic_value")
      expect(vm.code).to eq("magic_value")
    end
  end

  describe "#refund" do
    it "should cancel all credit" do
      vm.insert_cash(1)
      vm.refund()
      expect(vm.credit).to eq(0)
    end

    it "should return all previous credit as change" do
      vm.insert_cash(1)
      vm.refund()
      expect(vm.change).to eq(1)
    end

    it "should add new change to existing change" do
      vm.insert_cash(1)
      vm.refund()
      vm.insert_cash(1)
      vm.refund()
      expect(vm.change).to eq(2)
    end

    it "should clear the code state" do
      vm.insert_cash(1)
      vm.refund()
      expect(vm.code).to eq('')
    end

    it "should clear the status message state" do
      vm.insert_cash(1)
      vm.refund()
      expect(vm.status).to eq('')
    end

  end

  describe "#vend" do
    context "When entered SKU code is invalid" do
      it "should have status message prompt for a valid code" do
        vm.enter_code("gibberish")
        vm.vend()
        expect(vm.status).to eq("Invalid Code")
      end
      it "should clear the code state" do
        vm.enter_code("gibberish")
        vm.vend()
        expect(vm.code).to eq('')
      end
    end

    context "When entered SKU code is out of stock" do
      it "should have status message prompt 'out of stock' status" do
        vm.enter_code('2')
        vm.vend()
        expect(vm.status).to eq("Out of stock.")
      end
      it "should clear the code state" do
        vm.enter_code('2')
        vm.vend()
        expect(vm.code).to eq('')
      end
    end

    context "When entered SKU is valid, but credit is insufficient" do
      it "should have status message prompt the user to insert additional cash" do
        vm.enter_code('1')
        vm.vend()
        expect(vm.status).to eq("Insufficient funds, please insert cash.")
      end
      it "should have status message include the required cash ammount" do
      end
    end

    context "When entered SKU is valid, and credit is sufficient" do
      it "should decrement the purchased SKU's quantity" do
        vm.enter_code('1')
        vm.insert_cash(2)
        vm.vend()
        sku = vm.get_sku('1')
        expect(sku.quantity)
      end
      it "should deduct the SKU's price from credit before dispensing change" do
      end
      it "should add the purchased product into purchases" do
      end
      it "should add new purchases into existing purchases" do
      end
    end
  end
  # Go...!

end
