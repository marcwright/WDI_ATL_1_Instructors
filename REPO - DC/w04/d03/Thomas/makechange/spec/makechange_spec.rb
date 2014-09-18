require 'spec_helper'
require_relative '../lib/makechange'

  describe "#make_change" do

    it "returns the same amount of change inputted" do
      expect( make_change(25) ).to eq("quarter")
    end

  end
