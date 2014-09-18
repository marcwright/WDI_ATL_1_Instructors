require_relative "../lib/light.rb"

describe Light do

  #"::" convention saying this is a class method
  describe "::new" do

    it "starts off" do
      light = Light.new
      expect(light.on?).to(be_false)
    end
  end

  # "#" convention saying this is an instance method
  describe "#flip!" do

    it "turns the light on if it is off" do
      light = Light.new
      light.flip!
      expect(light.on?).to(be_true)
    end

    it "turns the light off if it is on" do
      light = Light.new
      light.flip!
      light.flip!
      expect(light.on?).to(be_false)
    end

  end

end
