require 'spec_helper'

require_relative '../lib/change'

describe Change do

  describe "::make_change" do
    it "returns a combination of quarters, dimes, nickels, and pennies equal to the change amount" do
      Change.new
      expect( Change.make_change(45)).to eq("1 quarter, 2 dimes")
    end

    it "returns the least number of coins" do
      Change.new
      expect( Change.make_change(50) ).to eq("2 quarters")
    end

    it "returns a combination of quarters, dimes, nickels, and pennies equal to the change amount" do
      Change.new
      expect( Change.make_change(68)).to eq("2 quarters, 1 dime, 1 nickel, 3 pennies")
    end

  end

end
