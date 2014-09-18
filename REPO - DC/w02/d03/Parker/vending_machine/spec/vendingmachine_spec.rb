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

	it "should return a Sku object for a valid code." do
		sku = vm.get_sku('full_slot')
		expect( vm.get_sku('full_slot').code ).to eq('full_slot')
	end
  
end