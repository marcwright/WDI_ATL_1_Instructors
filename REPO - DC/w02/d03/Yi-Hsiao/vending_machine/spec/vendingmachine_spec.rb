#   * **When entered SKU is valid, but credit is insufficient**
#     * should have status message prompt the user to insert additional cash.
#     * should have status message include the required cash ammount.
#   * **When entered SKU is valid, and credit is sufficient**
#     * should decrement the purchased SKU's quantity.
#     * should deduct the SKU's price from credit before dispensing change.
#     * should add the purchased product into purchases.
#     * should add new purchases into existing purchases.

require "spec_helper"
require_relative "../lib/sku"
require_relative "../lib/vendingmachine"

describe VendingMachine do
  def rand_pos_float
    rand( 0.01..10 ).round( 2 )
  end

  def rand_pos_int
    rand( 2..10 )
  end

  def rand_alpha
    a_z = ( 'a'..'z' ).to_a
    ( 0..10 ).map { a_z[ rand( 26 )]}.join
  end

  let( :in_stock ) { Sku.new( rand_alpha, rand_alpha, rand_pos_float, rand_pos_int )}
  let( :out_of_stock ) { Sku.new( rand_alpha, rand_alpha, rand_pos_float, 0 )}
  let( :empty_slot ) { Sku.new( rand_alpha )}
  subject( :vm ) { VendingMachine.new([ in_stock, out_of_stock, empty_slot ])}

  let( :amt_inserted ) { rand_pos_float }
  let( :prev_payments ) { rand(1..10).times.map { rand_pos_float }}

  let( :invalid_code ) { "_non_existent_code_" }

  describe "#get_sku" do
    it "returns the sku object for a valid code" do
      expect( vm.get_sku( in_stock.code )).to eq( in_stock )
    end

    it "returns `nil` for an invalid code" do
      expect( vm.get_sku( invalid_code )).to eq( nil )
    end
  end # - end of describe "#get_sku"

  describe "#insert_cash" do
    it "adds credit equal to the amount of cash inserted" do
      vm.insert_cash( amt_inserted )
      expect( vm.credit ).to eq( amt_inserted )
    end

    context "when there is existing credit" do
      before { prev_payments.each { |amt| vm.insert_cash( amt ) }}

      it "adds new credit to existing credit" do
        vm.insert_cash( amt_inserted )
        expect( vm.credit ).to eq( prev_payments.reduce( &:+ ) + amt_inserted )
      end
    end # end of context "when there is existing credit"
  end # end of describe "#insert_cash"

  describe "#enter_code" do
    it "sets the code state" do
      rand_code = rand_alpha
      vm.enter_code( rand_code )
      expect( vm.code ).to eq( rand_code )
    end
  end # end of describe "#enter_code"

  describe "#refund" do
    context "when there is another status message" do
      before { vm.vend }

      it "clears any status messages" do
        vm.refund
        expect( vm.status ).to eq("")
      end
    end

    context "when someone has inserted cash and entered a code" do
      before do
        prev_payments.each { |amt| vm.insert_cash( amt ) }
        vm.enter_code( rand_alpha )
      end

      it "returns credit as change" do
        vm.refund
        expect( vm.change ).to eq( prev_payments.reduce(&:+) )
      end

      it "zeroes out all credit" do
        vm.refund
        expect( vm.credit ).to eq( 0 )
      end

      it "clears any code that has been entered" do
        vm.refund
        expect( vm.code ).to eq("")
      end
    end # end of context "when someone has inserted cash and entered a code"

    context "when there is existing change" do
      before { prev_payments.each { |amt| vm.insert_cash( amt ) }}

      it "adds change to any existing change" do
        vm.insert_cash( amt_inserted )
        vm.refund
        expect( vm.change ).to eq( prev_payments.reduce( &:+ ) + amt_inserted )
      end
    end # end of context "when there is existing change"
  end # end # end of describe "#refund"

  describe "#vend" do
    context "when someone enters an invalid SKU code" do
      before { vm.enter_code( invalid_code ) }

      it "sets the status message to let the user know the code is invalid" do
        vm.vend
        expect( vm.status ).to eq( "Sorry, #{ invalid_code } is not a valid code." )
      end

      it "clears the invalid code that has been entered" do
        vm.vend
        expect( vm.code ).to eq( "" )
      end
    end # end of context "when someone enters an invalid SKU code"

    context "when an item is out of stock" do
      before { vm.enter_code( out_of_stock.code )}

      it "sets the status message to inform the item is out of stock" do
        vm.vend
        expect( vm.status ).to eq( "Sorry, #{ out_of_stock.product } is out of stock." )
      end

      it "clears the code that has been entered" do
        vm.vend
        expect( vm.code ).to eq( "" )
      end
    end

    context "when the SKU is valid, but there isn't enough credit to purchase the item" do
      before do
        vm.insert_cash( rand( in_stock.price ) )
        vm.enter_code( in_stock.code )
      end

      it "sets the status message to inform there isn't enough credit" do
        vm.vend
        expect( vm.status ).to eq( "Sorry, you need #{ in_stock.price } to purchase a #{ in_stock.product }." )
      end
    end

    context "when the SKU is valid and there is enough credit to purchase the item" do
      before do
        vm.insert_cash( in_stock.price + rand_pos_float )
        vm.enter_code( in_stock.code )
      end

      it "decreases the SKU's quantity by 1" do
        final_qty = in_stock.quantity - 1
        vm.vend
        expect( in_stock.quantity ).to eq( final_qty )
      end

      it "sets the credit to 0" do
        vm.vend
        expect( vm.credit ).to eq( 0 )
      end

      it "deducts the SKU's price and return the remaining amount as change" do
        change = vm.credit - in_stock.price
        vm.vend
        expect( vm.change ).to eq( change )
      end

      it "should record the SKU's purchase" do
        vm.vend
        expect( vm.purchases.find { |sku| sku == in_stock.code }).to be_truthy
      end

      it "should record all the SKU's purchases including existing purchases" do
        2.times do
          vm.insert_cash( in_stock.price + rand_pos_float )
          vm.enter_code( in_stock.code )
          vm.vend
        end
        expect( vm.purchases.find_all { |sku| sku == in_stock.code }.length ).to eq(2)
      end
    end
  end # end of describe "#vend"
end
