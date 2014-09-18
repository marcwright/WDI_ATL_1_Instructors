require 'spec_helper'
require_relative '../lib/water_bottle'

describe WaterBottle do
  let( :water_bottle ){ WaterBottle.new }

  describe "::new" do
    it "starts empty" do
      expect( water_bottle.water ).to eq(0)
    end
  end

  describe "#fill!" do
    it "fills the water bottle" do
      water_bottle.fill!
      expect( water_bottle.water ).to eq(3)
    end
  end

  describe "#dispense!" do
    it "dispenses water when completely filled" do
      water_bottle.fill!
      water_bottle.dispense!
      expect( water_bottle.water ).to eq(2)
    end

    it "dispenses water when 2/3 filled" do         water_bottle.fill!
      water_bottle.dispense!
      water_bottle.dispense!
      expect( water_bottle.water ).to eq(1)
    end

    it "dispenses water when 1/3 filled" do
      water_bottle.fill!
      water_bottle.dispense!
      water_bottle.dispense!
      water_bottle.dispense!
      expect( water_bottle.water ).to eq(0)
    end

    it "does not dispense water if the bottle is empty" do
      water_bottle.dispense!
      expect( water_bottle.dispense! ).to eq("There is no water in here.")
    end
  end

end
