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
    it "should return a Sku object for a product code" do
      expect( vm.get_sku('full_slot').code ).to eq('full_slot')
    end

    it "should return nil for an invalid code" do
      expect( vm.get_sku('its_not_here') ).to eq(nil)
    end
  end # end describe #get_sku

  describe "#insert_cash" do
    it "should add credit." do
      vm.insert_cash(5)
      expect( vm.credit ).to eq 5
    end

    it "should add new credit to existing credit." do
      vm.insert_cash(1)
      vm.insert_cash(1)
      expect( vm.credit ).to eq 2
    end
  end

  describe "#enter_code" do
    it "should set the code state." do
      vm.enter_code("magic_value")
      expect( vm.code ).to eq "magic_value"
    end
  end

  describe "#refund" do
    it "should cancel all creidt." do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.credit ).to eq(0)
    end
    it "should return all previous credit as change." do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.change ).to eq(1)
    end
    it "should add new change to existing change" do
      vm.insert_cash(1)
      vm.refund
      vm.insert_cash(1)
      vm.refund
      expect( vm.change ).to eq(2)
    end
    it "should clear the code state" do
      vm.refund()
      expect( vm.code ).to eq('')
    end
  end # ends describe #refund

  describe "#vend" do
    context "When entered SKU code is invalid" do
      it "should have status message prompt" do
        vm.enter_code("giberish")
        vm.vend()
        expect( vm.status ).to eq("invalid code")
      end
      it "should clear the code state" do
        vm.enter_code("giberish")
        vm.vend()
        expect( vm.code ).to eq('')
      end
    end
    context "When entered SKU code is out of stock" do

    end
    context "When entered SKU is valid, but credit is insufficient" do

    end
  end # end describe #vend
end # ends describe VendingMachine
