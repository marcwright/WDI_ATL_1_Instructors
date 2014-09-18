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
    it "should return a Sku object for a valid code." do
      expect( vm.get_sku("1").code ).to eq "1"
    end

    it "should return nil for an invalid code." do
      expect( vm.get_sku("99") ).to eq nil
    end
  end

  describe "#insert_cash" do
    before { vm.insert_cash(1.00) }

    it "should add credit." do
      expect( vm.credit ).to eq 1.00
    end

    it "should add new credit to existing credit." do
      vm.insert_cash(1.00)
      expect( vm.credit ).to eq 2.00
    end
  end

  describe "#enter_code" do
    before { vm.enter_code("1") }
    
    it "should set the code state." do
      expect( vm.code ).to eq "1"
    end
  end

  describe "#refund" do
    before do
      vm.insert_cash(1.00)
      vm.enter_code("1")
      vm.refund()
    end

    it "should cancel all credit." do
      expect( vm.credit ).to eq 0
    end

    it "should return all previous credit as change." do
      expect( vm.change ).to eq 1.00
    end

    it "should add new change to existing change." do
      vm.insert_cash(1.00)
      vm.refund()
      expect( vm.change ).to eq 2.00
    end

    it "should clear the code state." do
      expect( vm.code ).to eq ""
    end

    it "should clear the status state." do
      expect( vm.status ).to eq ""
    end
  end

  describe "#vend" do
    context "When entered SKU code is invalid" do
      before do
        vm.enter_code("99")
        vm.vend()
      end

      it "should prompt for a valid code." do
        expect( vm.status ).to include "valid code"
      end

      it "should clear the code state." do
        expect( vm.code ).to eq ""
      end
    end

    context "When entered SKU code is out of stock" do
      before do
        vm.enter_code("2")
        vm.vend()
      end

      it "should prompt 'out of stock' status." do
        expect( vm.status ).to include "out of stock"
      end

      it "should clear the code state." do
        expect( vm.code ).to eq ""
      end
    end

    context "When entered SKU is valid, but credit is insufficient" do
      before do
        vm.insert_cash(1.00)
        vm.enter_code("1")
        vm.vend()
      end

      it "should prompt the user to insert additional cash." do
        expect( vm.status ).to include "additional"
      end

      it "should include the required outstanding balance." do
        expect( vm.status ).to include "$0.50"
      end
    end

    context "When entered SKU is valid, and credit is sufficient" do
      before do
        vm.insert_cash(2.00)
        vm.enter_code("1")
        vm.vend()
      end

      it "should decrement the purchased SKU's quantity." do
        expect( vm.get_sku("1").quantity ).to eq 4
      end

      it "should deduct the SKU's purchase price from credit before dispensing change." do
        expect( vm.change ).to eq 0.50
      end

      it "should add the purchased product into purchases." do
        expect( vm.purchases ).to include "Coke"
      end

      it "should add new purchases into existing purchases." do
        vm.insert_cash(2.00)
        vm.enter_code("1")
        vm.vend()
        expect( vm.purchases ).to eq ["Coke", "Coke"]
      end
    end
  end
  
end