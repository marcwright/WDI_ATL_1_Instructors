require_relative "../lib/fortune"

describe FortuneCookie do

  let( :fortune ){ FortuneCookie.new }

  describe "::new" do
    it "starts wrapped" do
      expect( fortune.wrapped? ).to be_truthy
    end
  end

  describe "#unwrap!" do
    it "unwraps the fortune cookie" do
      fortune.unwrap!
      expect(fortune.wrapped?).to be_falsy
    end
  end

  describe "#crack!" do
    it "tells you to unwrap the cookie if it is unwrapped" do
      expect( fortune.crack! ).to eq("Please unwrap the cookie before you crack it.")
    end

    it "cracks a cookie open only if it is unwrapped" do
      fortune.unwrap!
      fortune.crack!
      expect( fortune.cracked? ).to be_truthy
    end
  end

  describe "#read" do
    it "tells you to unwrap the cookie if it's unwrapped" do
      expect( fortune.read ).to eq("Please unwrap the cookie before you read it.")
    end

    context "when the cookie is unwrapped" do
      before( :each ) { fortune.unwrap! }

      it "tells you to crack the cookie open if it's not open" do
        expect( fortune.read ).to eq("Please crack open the cookie before you read it.")
      end

      it "reads a fortune if the cookie is cracked open" do
        fortune.crack!
        expect( fortune.read ).to eq("A dubious friend may be an enemy in camouflage.")
      end
    end
  end
end
