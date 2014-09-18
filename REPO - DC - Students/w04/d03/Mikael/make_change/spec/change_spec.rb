require 'rspec'
require_relative '../lib/make_change'

describe "#make_change" do
  it "returns quarters, dimes, nickels and pennies that equal the amount of cents input" do
    expect(make_change(75)).to eq("3 quarters, 0 dimes, 0 nickels, 0 pennies")
  end

  it "returns quarters, dimes, nickels, and pennies that equal the amount of cents input" do
    expect(make_change(80)).to eq("3 quarters, 0 dimes, 1 nickels, 0 pennies")
  end

  it "returns quarters, dimes, nickels, and pennies that equal the amount of cents input" do
    expect(make_change(24)).to eq("0 quarters, 2 dimes, 0 nickels, 4 pennies")
  end
end
