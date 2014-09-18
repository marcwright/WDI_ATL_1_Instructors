require_relative "../lib/fortune"

describe FortuneCookie do

  describe "::new" do
    it "starts wrapped" do
      fortune = FortuneCookie.new
      expect(fortune.wrapped?).to be_truthy
    end
  end

  describe "#unwrap!" do
    it "unwraps the fortune cookie" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      expect(fortune.wrapped?).to be_falsey
    end
  end

  describe "#crack!" do
    it "cracks it open when cookie is unwrapped" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      fortune.crack!
      expect(fortune.cracked?).to be_truthy
    end

    it "doesn't crack if cookie is still wrapped" do
      fortune = FortuneCookie.new
      fortune.crack!
      expect(fortune.cracked?).to be_falsey
    end
  end
end
