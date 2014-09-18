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
      #       take the vm instance, run get_sku w '2' as arg, return just the code attribute
      #                             .to eq('2') - comparing your value to '2'
      expect( vm.get_sku('2').code ).to eq('2')
    end

    it "should return nil for an invalid code" do
      expect( vm.get_sku('fake_item')).to eq(nil)
    end
  end #end get_sku

  describe "#insert_cash" do
    it "should add credit" do
      vm.insert_cash(5)
      expect( vm.credit ).to eq (5)
    end

    it "should add new credit to existing credit" do
      vm.insert_cash(1)
      vm.insert_cash(1)
      expect( vm.credit ).to eq (2)
    end
  end#end insert_cash

  describe "#enter_code" do
    it "should set the code state" do
      vm.enter_code("magic_value")
      expect( vm.code ).to eq("magic_value")
    end
  end #end enter_code

  describe "#refund" do
    it "should cancel all credit" do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.credit ).to eq(0)
    end

    it "should return all previous credit as change" do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.change ).to eq(1)
    end

    it "should add new change to existing change" do
      vm.insert_cash(3)
      vm.refund
      vm.insert_cash(3)
      vm.refund
      expect( vm.change ).to eq(6)
    end

    it "should clear the code state" do
      vm.refund
      expect( vm.code ).to eq("")
    end

    it "should clear the status message state" do
      vm.refund
      expect( vm.status ).to eq("")
    end
  end #end refund

  describe "#vend" do
    context "When entered SKU code is invalid" do
      it "should have status message prompt for a valid code" do
        vm.enter_code("crazy_business")
        vm.vend
        expect(vm.status).to eq("Invalid")
      end
    end #end context sku is invalid
  end #end vend
end
