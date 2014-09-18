# Run RSPEC from root folder, NOT ../rsepc/ folder

require 'spec_helper'
require_relative '../lib/change'

describe Coin do
  subject(:coin) { Coin.new("quarter", 0.25)}

  describe "#value" do
    it "has a monetary value" do
    expect ( coin.value ).to eq(0.25)
    end
  end

  describe "#name" do
    it "has a currency name" do
    expect ( coin.name ).to eq("quarter")
    end
  end

end
