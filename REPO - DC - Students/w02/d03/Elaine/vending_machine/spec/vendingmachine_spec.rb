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

  # Go...!

  describe "#get_sku" do
    it "should return a Sku object for a valid code" do
      vm.get_sku("1")
      expect( vm.get_sku("1" ).code ).to eq("1")
    end

    it "should return nil for an invalid code" do
      vm.get_sku("its_not_here")
      expect( vm.get_sku("its_not_here" )).to eq(nil)
    end
  end

  describe "#insert_cash" do
    it "should add credit" do
      vm.insert_cash(5)
      expect( vm.credit ).to eq(5)
    end

    it "should add new credit to existing credit" do
      vm.insert_cash(5)
      vm.insert_cash(1)
      expect( vm.credit ).to eq(6)
    end
  end

  describe "#enter_code" do
    it "should set the code state" do
      vm.enter_code(2)
      expect( vm.code ).to eq(2)
    end
  end

  describe "#refund" do
    it "should cancel all credit" do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.credit ).to eq(0)
    end

    it "should return all previous credit as change." do
      vm.insert_cash(5)
      vm.refund()
      expect( vm.change ).to eq(5)
    end

    it "should add new change to existing change." do
      vm.insert_cash(5)
      vm.refund()
      vm.insert_cash(1)
      vm.refund()
      expect( vm.change ).to eq(6)
    end

    it "should clear the code state." do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.code ).to eq('')
    end

    it "should clear the status message state." do
      vm.insert_cash(1)
      vm.refund()
      expect( vm.status ).to eq('')
    end

  end # ends refund

  describe "#vend" do
    context "when the SKU code entered is invalid" do
      it "should have status message prompt for a valid code when the entered code is invalid" do
        vm.enter_code('invalid code')
        vm.vend
        expect( vm.status ).to eq('Please enter a valid code')
      end

      it "should have status message prompt for a valid code when the entered code is invalid" do
        vm.enter_code('invalid code')
        vm.vend
        expect( vm.status ).to eq('Please enter a valid code')
      end

      it "should clear the code state when the entered code is invalid" do
        vm.enter_code('invalid code')
        vm.vend
        expect( vm.code ).to eq('')
      end
    end # ends invalid code context

    context "when the SKU entered is out of stock" do
      it "should have status message prompt 'out of stock' status." do
        vm.enter_code('3')
        vm.vend
        expect( vm.status ).to eq("Out of stock")
      end

      it "should clear the code state when the entered code is invalid" do
        vm.enter_code('3')
        vm.vend
        expect( vm.code ).to eq('')
      end

    end # ends context

    context "when entered SKU is valid, but credit is insufficient" do
      it "should have status message prompt the user to insert additional cash." do
        vm.enter_code('1')
        vm.vend
        expect( vm.status ).to eq("Need more money")
      end

      # it "should have status message include the required cash amount." do
      #   vm.enter_code('1')
      #   vm.vend
      #   expect( vm.status ).to eq("Need more money")
      # end
    end # ends context

    context "when entered SKU is valid, and credit is sufficient" do
      it "should decrement the purchased SKU's quantity." do
        vm.enter_code('1')
        vm.insert_cash(2)
        vm.vend
        sku = vm.get_sku('1')
        expect( sku.quantity ).to eq(4)
      end
    end # ends context

  end # ends vend


# When entered SKU is valid, and credit is sufficient
# should decrement the purchased SKU's quantity.
# should deduct the SKU's price from credit before dispensing change.
# should add the purchased product into purchases.
# should add new purchases into existing purchases.

end # ends VendingMachine
