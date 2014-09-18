require_relative "../lib/fortune"

describe FortuneCookie do

  describe "::new" do
    it "starts wrapped" do
      fortune = FortuneCookie.new
      expect( fortune.wrapped? ).to be_true
    end
  end

  describe "#unwrap!" do

    it "unwraps the fortune cookie" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      expect( fortune.wrapped? ).to be_false
    end

  end

  describe "#crack!" do
    it "cracks it open if the cookie is unwrapped" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      fortune.crack!
      expect( fortune.cracked? ).to be_true
    end

    it "does not crack if the cookie is still wrapped" do
      fortune = FortuneCookie.new
      fortune.crack!
      expect( fortune.cracked? ).to be_false
    end
  end

  describe "#read" do
    it "tells you to unwrap it if it is still wrapped" do
      fortune = FortuneCookie.new
      expect( fortune.read ).to eq("Unwrap me!")
    end

    it "tells you to crack it if it is still uncracked" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      expect( fortune.read ).to eq("Crack me!")
    end

    it "reads you a fortune if it is unwrapped and cracked" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      fortune.crack!
      expect( fortune.read ).to eq("You will be really good at testing")
    end
  end

end
