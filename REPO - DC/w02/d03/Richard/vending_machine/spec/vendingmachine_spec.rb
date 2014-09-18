
require_relative '../lib/sku'
require_relative '../lib/vendingmachine'
require 'pry'

describe VendingMachine do
  let(:vm) do
    VendingMachine.new([
      Sku.new('1', 'Coke', 1.50, 5),
      Sku.new('2', 'Diet Coke', 1.50, 0),
      Sku.new('3')
    ])
  end

  describe "#get_sku" do
    it "should return an Sku object for a valid code." do
      expect( vm.get_sku('1').product ).to eq('Coke')
    end

    it "should return nil for an invalid code" do
      expect( vm.get_sku('banana') ).to eq(nil)
    end
  end

  describe "#insert_cash" do
    it "should add credit" do
      vm.insert_cash(1.00)
      expect( vm.credit ).to eq(1.00)
    end

    it "should add credit to existing credit" do
      vm.insert_cash(1.00)
      expect(vm.insert_cash(1.00) ).to eq(2.00)
    end
  end

  describe "#enter_code" do
    it "should set the code state" do
      vm.enter_code('2')
      expect( vm.code ).to eq('2')
    end
  end

  describe "#refund" do
    it "should cancel all credit" do
      vm.refund(5.00, 2.00)
      expect( vm.credit ).to eq(0)
    end

    it "should return all previous credit as change" do
      vm.refund(5.00, 2.00)
      expect( vm.change ).to eq(3.00)
    end

    it "should clear the code state" do
      vm.refund(5.00, 2.00)
      expect( vm.code ).to eq('')
    end

    it "should clear the status message state." do
      vm.refund(5.00, 2.00)
      expect( vm.status ).to eq('')
    end
  end

  describe "#vend" do
    context "When entered SKU code is invalid" do
      it "should have status message prompt for a valid code." do
        vm.enter_code('banana')
        vm.vend
        expect( vm.status ).to eq("Code is invalid, try another.")
        expect( vm.code ).to eq('')
      end
    end

    context "When entered SKU code is valid" do
      it "should have status message prompt for item out of stock." do
        vm.enter_code('2')
        vm.vend
        expect( vm.status ).to eq("Item is out of stock.")
        expect( vm.code ).to eq('')
      end
    end

    context "When entered SKU is valid, but credit is insufficient" do
      it "should have status message prompt the user to insert additional cash." do
        vm.enter_code('1')
        vm.vend
        #expect( vm.status ).to eq('Give me $1.50 more dollars.')
      end
    end

    context "When entered SKU is valid, but credit is sufficient" do
      it "should decrement the purchased SKU's quantity." do
        vm.enter_code('1')
        vm.insert_cash(2)
        vm.vend
        sku = vm.get_sku('1')
        expect( sku.quantity ).to eq(4)
      end
    end

  end

end
