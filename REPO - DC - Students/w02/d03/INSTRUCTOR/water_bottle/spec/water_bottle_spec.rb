require 'spec_helper'
require_relative '../lib/water_bottle'

# we're writing tests for the WaterBottle class
describe WaterBottle do
  describe "::new" do
    it "is empty when created" do
      water_bottle = WaterBottle.new
      expect(water_bottle.is_empty?).to eq(true)
    end
  end

  describe "#fill" do
    it "fills the bottle" do
      water_bottle = WaterBottle.new
      water_bottle.fill
      expect(water_bottle.is_empty?).to eq(false)
    end
  end

  describe "#dispense" do
    context "when full" do
      let(:water_bottle) { WaterBottle.new }
      before do
        water_bottle.fill
      end

      it "can dispense water" do
        expect(water_bottle.dispense).to eq("Water")
      end

      it "empties the bottle" do
        water_bottle.dispense
        expect(water_bottle.is_empty?).to eq(true)
      end
    end # context - when full

    context "when empty" do
      it "can't dispense water" do
        water_bottle = WaterBottle.new
        expect(water_bottle.dispense).to eq(false)
      end
    end
  end










end # describe - WaterBottle
