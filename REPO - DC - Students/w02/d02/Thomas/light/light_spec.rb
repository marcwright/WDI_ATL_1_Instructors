require_relative "../spec/light"

describe Light do

  describe "::new" do

    it "starts off" do
      light = Light.new
      expect( light.on? ).to be_false
    end

  end

  describe "#flip" do

    it "turns the light on if it is off" do
      light = Light.new
      light.flip!
      expect( light.on? ).to be true
    end

    it "turns the light off if it is on" do
      light = Light.new
      light.flip!
      light.flip!
      expect( light.on? ).to be false
    end

  end

end
