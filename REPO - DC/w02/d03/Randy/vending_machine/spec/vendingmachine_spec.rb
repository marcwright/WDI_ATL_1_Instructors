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
      expect(vm.get_sku("1").product).to eq("Coke")
    end
    it "should return nil for an invalid code." do
      expect(vm.get_sku("5")).to eq(nil)
    end
  end

  describe "#insert_cash" do
    it "should add credit." do
      vm.insert_cash(3.00)
      expect(vm.credit).to eq(3.00)
    end
    it "should add new credit to existing credit." do
      vm.insert_cash(1.50)
      vm.insert_cash(2.00)
      expect(vm.credit).to eq(3.50)
    end
  end

  describe "#enter_code" do
    it "should set the code state" do
      vm.enter_code("123")
      expect(vm.code).to eq("123")
    end
  end

  describe "#refund" do
    it "should cancel all credit." do
      vm.insert_cash(5.00)
      vm.refund
      expect(vm.credit).to eq(0)
    end
    it "should return all previous credit as change." do
      vm.insert_cash(5.00)
      vm.refund
      expect(vm.change).to eq (5.00)
    end
    it "should add new change to existing change." do
      vm.insert_cash(5.00)
      vm.refund
      vm.insert_cash(5.00)
      vm.refund
      expect(vm.change).to eq(10.00)
    end
    it "should clear the code state." do
      vm.enter_code("123")
      vm.refund
      expect(vm.code).to eq('')
    end
    it "should clear the status message state." do
      vm.status = "I'm_still_here"
      vm.refund
      expect(vm.status).to eq('')
    end
  end

  describe '#vend' do
    context "When entered SKU code is invalid" do
     before(:each) do
      vm.enter_code("not_valid")
      vm.vend
     end
      it "should have status message prompt for a valid code." do
        expect(vm.status).to eq("Please enter a valid code!")
      end
      it "should clear the code state." do
        expect(vm.code).to eq('')
      end
    end #End of context

    context "When entered SKU code is out of stock" do
     before(:each) do
      vm.enter_code("2")
      vm.vend
     end
      it "should have status message prompt 'out of stock' status." do
      expect(vm.status).to eq("Out of Stock")
      end
      it "should clear the code state." do
      expect(vm.code).to eq('')
      end
    end#End of context

    context "When entered SKU is valid, but credit is insufficient" do
     before(:each) do
      vm.enter_code("1")
      vm.vend
     end
      it "should have status message prompt the user to insert additional cash." do
        expect(vm.status).to eq("Insert more $$")
      end
      it "should have status message include the required cash ammount." do
        expect(vm.status).to eq(1.50)
      end
    end #End of context

    context "When entered SKU is valid, and credit is sufficient" do
     before(:each) do
      vm.enter_code("1")
      vm.insert_cash(20.00)
      vm.vend
     end
     it "should decrement the purchased SKU's quantity." do
      expect()
     end
    # should deduct the SKU's price from credit before dispensing change.
    # should add the purchased product into purchases.
    # should add new purchases into existing purchases.
    end #End of context
  end #End of describe





  # Go...!

end
