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
    it "should return a Sku for a valid code input" do
      expect( vm.get_sku('full_slot').code ).to eq('full_slot')
    end

    it "should return nil for an invalid code" do
      expect( vm.get_sku('not_here') ).to eq(nil)
    end
  end

  describe "#insert_cash" do
    it "should add credit" do
      vm.insert_cash(5)
      expect( vm.credit ).to eq(5)
    end

    it "should add new credit to existing credit" do
      vm.insert_cash(5)
      vm.insert_cash(2)
      expect( vm.credit ).to eq(7)
    end
  end

  describe "#enter_code" do
    it "should set the code state" do
      vm.enter_code('magic')
      expect( vm.code ).to eq('magic')
    end
  end

  describe "#refund" do
    it "should cancel all credit" do
      vm.insert_cash(5)
      vm.refund()
      expect( vm.credit ).to eq(0)
    end

    it "should return all previous credit as change" do
      vm.insert_cash(4)
      vm.refund()
      expect( vm.change ).to eq(4)
    end

    it "should add new change to existing change" do
      vm.insert_cash(4)
      vm.refund()
      vm.insert_cash(4)
      vm.refund()
      expect( vm.change ).to eq(8)
    end

    it "should clear the code state" do
      vm.enter_code('full_slot')
      vm.refund()
      expect( vm.code ).to eq('')
    end

    it "should clear the status message" do
      vm.status = 'wowza'
      vm.refund()
      expect( vm.status ).to eq('')
    end
  end

  describe "#vend" do
    context "when the sku is invalid" do
      it "should have status message prompt for valid code" do
        vm.enter_code('banana')
        vm.vend()
        expect( vm.status ).to eq('invalid')
      end

      it "should clear the code state" do
        vm.enter_code('banana')
        vm.vend()
        expect( vm.code ).to eq('')
      end
    end

    context "when entered sku is out of stock" do
      it "should have status message saying 'sold out'" do
        vm.enter_code('empty_slot')
        vm.vend()
        expect( vm.status ).to eq('out of stock')
      end

      it "should clear the code state" do
        vm.enter_code('empty_slot')
        vm.vend()
        expect( vm.code ).to eq('')
      end
    end

    context "when sku is valid but credit is insufficient" do
      it "should have status message prompt the user to add more money" do
        vm.enter_code('full_slot')
        vm.vend()
        expect( vm.status ).to eq('not enough money')
      end

      it "should have status message include the required cash amount" do
        vm.enter_code('full_slot')
        vm.vend()
        expect( vm.status ).to eq(1.50)
      end

    end

    context "when entered sku is valid and credit is sufficient" do
      it "should decrement the sku's quantity" do
        vm.enter_code('full_slot')
        vm.insert_cash(2.00)
        vm.vend()
        sku = vm.get_sku('full_slot')
        expect( vm.quantity ).to eq(4)
      end
    end

  end

  # Go...!

end

# describe Sku do
#   let(:sku) do {Sku.new("1", "c")}
