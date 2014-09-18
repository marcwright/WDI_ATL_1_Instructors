require 'spec_helper'
require 'pry'
require_relative '../lib/water_bottle'

describe WaterBottle
  it "is empty when it is created" do
    water_bottle = WaterBottle.new
    expect(water_bottle.is_empty?).to be(true)
  end

  it "can be filled" do
    water_bottle = WaterBottle.new
    water_bottle.fill
    expect(water_bottle.is_empty?).to eq(false)
  end

  it "can dispense water unless bottle is empty" do
    water_bottle = WaterBottle.new
    water_bottle.dispense
    expect(water_bottle.fill).to eq(!false)
  end

  it "emtpies if water is dispensed" do
    water_bottle = WaterBottle.new
    water_bottle.empty
    expect(water_bottle.dispense).to eq(true)
  end



end

