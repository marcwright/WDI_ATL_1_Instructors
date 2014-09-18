require 'spec_helper'
require_relative '../lib/change'

# Write a method that takes a number of cents as input and in returns a combination of quarters, dimes, nickels, and pennies.

describe "make_change" do
  it "outputs the total" do
      expect(make_change.cents(50)).to eq(50)
  end
end
