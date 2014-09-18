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
    it "should return an object for the valid code" do
      expect( vm.get_sku("1").product ).to eq("Coke")
    end

    it "should return nil for an invalid code" do
      expect( vm.get_sku("44") ).to eq(nil)
    end
  end
  # Go...!

  describe "#insert_cash" do
    it "should add credit." do
      expect( vm.insert_cash(2.00) ).to eq(2.00)
    end

    it "should add new credit to existing credit." do
      vm.insert_cash(1.00)
      expect( vm.insert_cash(1.00) ).to eq(2.00)
    end
  end

  describe "#enter_code" do
    it "should add code to the code state." do
      vm.enter_code('1')
      expect( vm.code ).to eq('1')
    end
  end


  describe "#refund" do
    it "should cancel all credit"do
      vm.insert_cash(1.00)
      vm.refund
      expect( vm.credit ).to eq(0.00)
    end

    it "should return all previous credit as change" do
      vm.insert_cash(2.00)
      vm.refund
      expect( vm.change ).to eq(2.00)
    end

    it "should add new change to existing change." do
      vm.insert_cash(2.00)
      vm.refund
      vm.insert_cash(1.00)
      vm.refund
      expect( vm.change ).to eq(3.00)
    end

    it "should clear the code state" do
      vm.insert_cash(1.00)
      vm.refund
      expect( vm.code ).to eq("")
    end

    it "should clear the status message state" do
      vm.insert_cash(1.00)
      vm.refund
      expect( vm.status ).to eq("")
    end
  end

  describe "#vend" do
    context "for when SKu code is invalid" do
      before(:each) do
        vm.enter_code("poo")
      end

      it "should have message prompt for a valid code" do
        vm.vend()
        expect( vm.status ).to eq("Invalid Code")
      end

      it "should clear the code state." do
        vm.vend()
        expect( vm.code ).to eq("")
      end
    end

    context "When entered SKU code is out of stock" do
      it "should have status message prompt 'out of stock' status"do
        vm.enter_code("2")
        vm.vend
        expect( vm.status ).to eq("out of stock")
      end
    end
  end

  context "for when we entered a valid sku, but insufficient credit" do
    it "should have status message prompt the user to insert additonal cash." do
      vm.enter_code('1')
      vm.vend
      expect( vm.status ).to eq("Need more money")
    end
  end

  context "boop" do
    it "should decrement the purchased SKU's quantity" do
      vm.enter_code("1")
      vm.insert_cash(2)
      vm.vend
      sku = vm.get_sku("1")
      expect( sku.quantity ).to eq(4)
    end
  end
end
