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
end

describe "#get_sku" do

  vm = VendingMachine.new

  it "should return a Sku object for a valid code." do
    expect( vm.get_sku ("full_slot" )).to eq ("full_slot")
  end

  it "should return nil for an invalid code." do
    expect( vm.get_sku ("empty_slot"))
  end
end

describe "#insert_cash" do


end
