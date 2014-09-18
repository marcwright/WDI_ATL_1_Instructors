require_relative "../lib/gladiator"


describe Gladiator do
  let(:fighter1) {Gladiator.new("george", "trident")}

  it "has a name" do
    expect(fighter1.name).to eq("george")
  end

  it "has a weapon" do
    expect(fighter1.weapon).to eq("trident")
  end

end



