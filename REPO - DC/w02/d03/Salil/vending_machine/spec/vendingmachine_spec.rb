require_relative '../lib/sku'
require_relative '../lib/vendingmachine'

describe VendingMachine do
  let(:vm) do
    VendingMachine.new([
      Sku.new('full_slot', 'Coke', 1.50, 5),
      Sku.new('empty_slot', 'Diet Coke', 1.50, 0),
      Sku.new('blank_slot')
    ])
  end

  describe "#get_sku" do
    it "should return a Sku object for a valid code" do
      sku = vm.get_sku("full_slot")
      expect(sku.code).to eq("full_slot")
    end
  end

  describe "#insert_cash" do
    it "should add credit" do
      vm.insert_cash(5)
      expect(vm.credit).to eq(5)
    end


    it "should add new cash to existing credit" do
      vm.insert_cash(1)
      vm.insert_cash(1)
      expect(vm.credit).to eq(2)
    end
  end

  describe "#enter_code do" do
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
      vm.refund()
      expect(vm.code).to eq("")
    end

    it "should clear the status message" do
      vm.refund()
      expect(vm.status).to eq("")
    end
  end

  describe "#vend" do
    context "when entered SKU is invalied" do
      it "should have status message prompt for valid code" do
        vm.enter_code("gibberish")
        vm.vend()
        expect(vm.status).to eq("Please enter a valid code")
      end

    it "should cear the code state" do
        vm.enter_code("gibberish")
        vm.vend()
        expect(vm.code).to eq("")
      end
    end

    context "When entered SKU code is out of stock" do
      it "should have the status message prompt out of stock status" do
        vm.enter_code("empty_slot")
        vm.vend()
        expect(vm.status).to eq("Out of stock")
      end

      it "should set the code clear the code state" do
        vm.enter_code("empty_slot")
        vm.vend()
        expect(vm.code).to eq("")
      end
    end

    context "When entered SKU is valid, but credit is insufficient" do
      it "should have status message prompt the user to insert additional cash." do
        vm.enter_code("full_slot")
        vm.vend
        expect(vm.status).to eq("Insufficient funds")
      end
    end

    context "When entered SKU is valid, and credit is sufficient" do
      it "should decrement the purchased SKU's quantity." do
        vm.enter_code("full_slot")
        vm.insert_cash(2)
        vm.vend
        sku = vm.get_sku("full_slot")
        expect(sku.quantity).to eq(4)
      end
    end
  end
end
