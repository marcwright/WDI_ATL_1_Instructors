# require_relative "../lib/water_bottle"

# describe WaterBottle do
#   let(:water_bottle){WaterBottle.new}

#   describe "::new" do
#     it "starts empty" do
#       expect(water_bottle.empty?).to be_true
#     end
#   end

#   describe "#fill" do
#     it "fills the water bottle" do
#       water_bottle.fill
#       expect(water_bottle.empty?).to be_false
#     end
#   end

#   describe "#dispense_to_two_thirds" do
#     it "empties 1/3 of the water bottle if the bottle is full" do
#       water_bottle.fill
#       water_bottle.dispense_to_two_thirds
#       expect(water_bottle.level?).to eq(2/3)
#     end
#   end

#   describe "dispense_to_one_third" do
#     it "empties 1/3 of the bottle if the bottle is 2/3rds full" do
#       water_bottle.dispense_to_two_thirds
#       water_bottle.dispense_to_one_third
#       expect(water_bottle.level?).to eq(1/3)
#     end
#   end

# end

Travis Answer

require 'spec_helper'
require_relative '../lib/water_bottle'

# we're writing tests for the WaterBottle class
describe WaterBottle do
  it "it's empty when created" do
    water_bottle = WaterBottle.new
    expect(water_bottle.is_empty?).to be_true
  end

  it "can be filled" do
    water_bottle = WaterBottle.new
    water_bottle.fill
    expect(water_bottle.empty?).to be_false
  end

  describe "#dispense" do
    context "when it's full" do
      let(:water_bottle) {WaterBottle.new}
      before do
        water_bottle.fill
      end

      it "can dispense water" do
        expect(water_bottle.dispense).to eq("Water")
      end

      it "empties the bottle" do
        water_bottle.dispense
        expect(water_bottle.is_empty?).to be_true
      end
    end

    context "when empty" do
      it "can't dispense water" do
        water_bottle = WaterBottle.new
        expect(water_bottle.dispense).to eq(false)
      end
    end
end
