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
    it"should return a Sku object for a valid code." do
      sku = vm.get_sku( 'full_slot' )
      expect( sku.code ).to eq( 'full_slot' )
    end
    it "should return nil for an invalid code." do
      expect( vm.get_sku ( 'its_not_here' ) ).to eq( nil )
    end
  end # - END Get Sku

  describe "#insert_cash" do  
    it "should add credit" do
      expect( vm.insert_cash ).to eq( 5 )
    end
    it "should add new credit to exisiting credit" do
      expect( vm.insert_cash ).to eq(1)
      expect( vm.insert_cash ).to eq(1)
      expect( vm.credit ).to eq(2)
    end
  end # - END Insert Cash
  
  describe "#enter_code" do
    it "should set the code state" do
      vm.enter_code( "magic_value" )
      expect( vm.code ).to eq( "magic_value" )
    end
  end # - END Enter Code

  describe "#refund" do
    it "should return all previous credit as change" do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.change ).to eq(1)
    end

    it "should cancel all credit" do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.credit ).to eq(0)
    end
  end # - END Refund
end # -    E N D   VendingMachine


