require 'spec_helper'
require_relative "../lib/water_bottle"

# Create a bottle and set it equal to empty
describe WaterBottle do
  it "the water bottle can be instantiated/created" do
    bottle = WaterBottle.new("My New Bottle")
    expect(bottle.class).to be (WaterBottle)
  end

  let(:bottle) { WaterBottle.new("Tap Water Bottle") }
  it "object is named" do
    expect(bottle.name).to eq("Tap Water Bottle")
  end

# = Define water_level and set the level to empty (absolute value)
  describe "water_level" do
    water_level = bottle.water_level
      expect(bottle.empty?).to eq(true)
  end


end



# # Create "water level" and set a absolute value
# describe
# water_level
# empty vs full

# # Despense water and check the water level is equal to full
# describe
# despense_water
# empty = true

