require "spec_helper"
require_relative "../lib/gladiator"

describe Gladiator do
  let(:gd) do
    Gladiator.new("Russell", "Trident")
  end

  it "should have a name" do
    expect(gd.name).to eq("Russell")
  end

  it "should have a weapon" do
    expect(gd.weapon).to eq("Trident")
  end

end
