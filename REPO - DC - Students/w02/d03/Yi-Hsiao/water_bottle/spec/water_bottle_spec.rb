require "spec_helper"
require_relative "../lib/water_bottle.rb"

describe WaterBottle do
  subject( :water_bottle ) { WaterBottle.new }

  describe "::new" do
    it "starts empty" do
      expect( water_bottle.filled? ).to be_falsy
    end

    it "can hold 3 sips" do
      expect( water_bottle.max_capacity ).to eq(3)
    end
  end # - end of describe "::new"

  describe "#fill!" do

    context "when completely filled" do
      before { water_bottle.fill! }

      it "does nothing" do
        expect( water_bottle.fill! ).to be_falsy
      end
    end # - end of context "when completely filled"

    context "when partially filled" do
      before do
        water_bottle.fill!
        water_bottle.dispense
      end

      it "fills the water bottle to max capacity" do
        water_bottle.fill!
        expect( water_bottle.water_level ).to eq( water_bottle.max_capacity )
      end
    end # - end of context "when partially filled"

    context "when empty" do

      it "fills the water bottle to max capacity" do
        water_bottle.fill!
        expect( water_bottle.water_level ).to eq( water_bottle.max_capacity )
      end
    end # - end of context "when empty"
  end # - end of describe "#fill!"

  describe "dispense" do
    context "when water bottle is filled" do
      before { water_bottle.fill! }

      it "returns water" do
        expect( water_bottle.dispense ).to eq("water")
      end

      it "dispenses 1 sip at a time" do
        water_bottle.dispense
        expect( water_bottle.water_level ).to eq( water_bottle.max_capacity - 1 )
      end
    end # - end of context "when water bottle is filled"

    context "when water bottle is empty" do
      it "doesn't dispense water when it is empty" do
        water_bottle.dispense
        expect( water_bottle.dispense ).to be_falsy
      end

      it "doesn't dispense more water than it holds" do
        (water_bottle.water_level + 1).times { water_bottle.dispense }
        expect( water_bottle.water_level ).to eq(0)
      end
    end
  end
end
