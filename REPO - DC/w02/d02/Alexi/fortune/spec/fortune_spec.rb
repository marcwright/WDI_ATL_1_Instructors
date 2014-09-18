require_relative "../lib/fortrune"

describe FortuneCookie do 

  describe "::new" do
    it "starts wrapped" do
      fortune = FortuneCookie.new
        expect ( fortune.wrapped? ).to be_true
      end
    end

  describe "#unwrap!" do
    it "unwraps the fortune cookie" do
      fortune = FortuneCookie.new
      fortune.unwrap!
      expect(fortune.wrapped?).to be_false
    end
  end


end
