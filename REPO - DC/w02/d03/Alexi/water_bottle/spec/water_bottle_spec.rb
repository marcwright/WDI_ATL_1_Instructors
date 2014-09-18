require 'spec_helper'
require 'pry'
require_relative '../lib/water_bottle'

  describe WaterBottle do
    it "it's empty when created" do
      water_bottle = WaterBottle.new
      expect(water_bottle).is_empty? eq(true)
    end

  it "can be filled" do
    water_bottle = WaterBottle.new
    water_bottle.fill
    expect(water_bottle_is_empty?).to eq(false)
  end

  context "when it's full" do
    let(:water_bottle) {WaterBottle.new}
    before do
      water_bottle.fill
    end
  end

    it "can dispense water" do
      expect(water_bottle.dispense).to eq("Water")
    end

  end # - when full

  context "when empty" do
    it "can't dispense water" do
        expect(water_bottle.dispense).to eq(false)
    end
  end

end # - WaterBottle
