require_relative '../lib/light'

describe Light do

  describe "::new" do
    it "starts off" do
      light = Light.new
      expect(light.on?).to be_false
    end
  end

  describe "#flip!" do
    it "turns it on if it was off" do
      light = Light.new
      light.flip!
      expect(light.on?).to be_true
    end

    it "turns it off if it was on" do
      light = Light.new
      light.flip!
      light.flip!
      expect(light.on?).to be_false
    end
  end

end
