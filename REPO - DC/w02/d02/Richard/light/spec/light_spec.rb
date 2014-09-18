require_relative '../lib/light'


describe Light do |variable|

  # "::new" << Class method
  describe "::new" do

    it "starts off" do
      light = Light.new
      expect( light.on? ).to be_false
    end
  end

  # '#flip!' < instance method

  describe "#flip!" do
    it "turns the light on if it is off" do
      light = Light.new
      light.flip!
      expect( light.on? ).to be_true
    end


    it "turns the light off if it is on" do
      light = Light.new
      light.flip!
      light.flip!
      expect( light.on? ).to be_false
    end
  end
end
