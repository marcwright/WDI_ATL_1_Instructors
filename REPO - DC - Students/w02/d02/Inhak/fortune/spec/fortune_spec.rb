require_relative "../lib/fortune"

describe FortuneCookie do
  let( :fortune )( FortuneCookie.new )

  describe "::new" do
    it "starts wrapped" do
      expect( fortune.wrapped? ).to be_truthy
    end
  end

  describe "#unwrap!" do
    it "unwraps the fortune cookie." do
      fortune.unwrap!
      expect( fortune.wrapped? ).to be_falsey
    end
  end

  describe "#crack!" do
    it "cracks it open if the cookie is unwarpped" do
      fortune.unwrap!
      fortune.crack!
      expect( fortune.cracked? ).to be_truthy
    end

    it "does not crack if the cookie is still wrapped" do
      fortune.crack!
      expect( fortune.cracked? ).to be_falsey
    end
  end

  describe "#read" do
    it "tells you to unwrap it if it is still wrapped" do
      expect( fortune.read ).to eq("Unwrap me!")
    end

    it "tells you to crack it if it is still uncracked." do
      fortune.unwrap!
      expect(fortune.read ).to eq("Crack me!")
    end
  end
end
