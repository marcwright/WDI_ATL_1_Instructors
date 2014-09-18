require_relative "../lib/fortune"

describe FortuneCookie do

  describe "::new" do
    it "starts wrapped" do
      fortune = FortuneCookie.new
      expect( fortune.wrapped? ).to be_true
    end
  end


  describe "#unwrap!" do
    it "unwarps the forune cookie" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      expect(fortune.wrapped?).to be_false
    end
  end

  describe "#crack!" do
    it "cracks it open if cookie is unwrapped" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      fortune.crack!
      expect ( fortune.cracked? ).to be_true
    end


    it "does not crack if the cookie is still wrapped" do
      fortune = FortuneCookie.new
      fortune.crack!
      expect ( fortune.crack? ).to be_false
    end
  end
end
