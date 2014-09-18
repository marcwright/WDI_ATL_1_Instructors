require 'spec_helper'
require_relative "../lib/gladiator"

describe Gladiator do
  let(:glad) { Gladiator.new("Russell", "sword") }

  describe "::new" do
    it "can be instantiated" do
      expect( glad.class ).to eq(Gladiator)
    end

    it "has a name" do
      expect( glad.name ).to eq("Russell")
    end

    it "has a weapon" do
      expect( glad.weapon ).to eq("sword")
    end
  end


end
