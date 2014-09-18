require "spec_helper"
require "pry"
require_relative "../lib/water_bottle"

describe WaterBottle do
  desribe "::new" do
  it "begins empty" do
    water_bottle = Water_Bottle.new
    expect( water_bottle.isempty? ).to be_true
  end
end



  describe "#fill" do
    it "fills the bottle" do
      water_bottle.fill!
      expect( water_bottle.fill ).to be(3)
    end
  end

  context "when it's full" do
    let (:water_bottle) {Water_Bottle.new}
    before do
      water_bottle.fill
    end

  describe "#dispense" do
    it "dispenses from the bottle, leaving empty" do
      water_bottle.dispense
      expect( water_bottle.isempty? ).to be(@water_level - 1)
    end
  end

  context "when empty" do
    let (:water_bottle) {Water_Bottle.new}
    "it can't dispense water" do
      expecting( water_bottle.dispense ).to be_false
    end
  end

end
