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
    it "should return a sku object for a valid code" do
      expect( vm.get_sku('1').product ).to eq("Coke")
    end

    it "should return nil for an invalid code" do
      expect( vm.get_sku('6') ).to eq(nil)
    end

  end # get_sku

  describe "#insert_cash" do
    before { vm.insert_cash(3.00)}

    it "should add credit" do
      expect( vm.credit ).to eq(3.00)
    end

    it "should add new credit to existing credit" do
      vm.insert_cash(1.00)
      expect( vm.credit ).to eq(4.00)
    end

  end # insert_cash

  describe "#enter_code" do
    it "should set the code state" do
      vm.enter_code('1')
      expect( vm.code ).to eq('1')
    end
  end # enter_code

  describe "#refund" do
    it "should cancel all credit" do
      vm.refund
      expect( vm.credit ).to eq(0)
    end

    it "should return all previous credit as change" do
      vm.insert_cash(2.00)
      vm.refund
      expect( vm.change ).to eq(2.00)
    end

    it "should add new change to existing change" do
      vm.insert_cash(1.50)
      vm.refund
      vm.insert_cash(1.00)
      vm.refund
      expect( vm.change ).to eq(2.50)
    end

    it "should clear the code state" do
      vm.enter_code('3')
      vm.refund
      expect( vm.code ).to eq('')
    end

    it "should clear the status message state" do
      vm.vend
      vm.refund
      expect( vm.status ).to eq('')
    end

  end # refund

  describe "#vend" do
    context "when entered SKU code is invalid" do

      it "should have a status message prompt for a valid code" do
        vm.enter_code('6')
        vm.vend
        expect( vm.status ).to eq("Please enter a valid code.")
      end

      it "should clear the code state" do
        vm.vend
        expect( vm.code ).to eq("")
      end

    end # context - invalid SKU

    context "When entered SKU code is out of stock" do
      before do
        vm.enter_code('2')
        vm.vend
      end


      it "should have status message prompt 'out of stock' status" do
        expect( vm.status ).to eq("Out of stock.")
      end

      it "should clear the code state" do
        expect( vm.code ).to eq("")
      end

    end # context - out of stock


    context "when entered SKU is valid, but credit is insufficient" do
      before do
        vm.insert_cash(1.00)
        vm.enter_code('1')
        vm.vend
      end

      it "should have a status message to prompt the user to insert additional cash." do
        expect( vm.status ).to eq("Insufficient funds. Selected item costs $1.5")
      end

      it "should have a status message include the required cash amount." do
        expect( vm.status ).to eq("Insufficient funds. Selected item costs $1.5")
      end

    end # context - insufficient credit

    context "when entered SKU is valid, and credit is sufficient" do
      before do
        vm.insert_cash(2.00)
        vm.enter_code('1')
        vm.vend
      end

      it "should decrement the purchased SKU's quantity" do
        expect( vm.get_sku('1').quantity ).to eq(4)
      end

      it "should deduct the SKU's price from credit before dispensing change" do
        expect( vm.credit + vm.change ).to eq(0.5)
      end

      it "should add the purchased product into purchases" do
        expect( vm.purchases.last ).to eq("Coke")
      end

      it "should add new purchases into existing purchases" do
        vm.insert_cash(1.50)
        vm.enter_code('1')
        vm.vend
        expect( vm.purchases.last ).to eq("Coke")
      end

    end # context - sufficient credit, valid SKU
  end
end
