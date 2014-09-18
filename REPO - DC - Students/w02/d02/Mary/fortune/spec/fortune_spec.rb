require_relative '../lib/fortune'

describe FortuneCookie do
  #can do this for repetitive language! sets the symbol equal to new instance for all; same as "fortune = Fortune.new" on every test
  let ( :fortune ) { FortuneCookie.new }

  describe "::new" do
    it "starts wrapped" do
      expect( fortune.wrapped? ).to be_truthy
    end
  end

  describe "#unwrap!" do
    it "unwraps the fortune cookie" do
      fortune.unwrap!
      expect( fortune.wrapped? ).to be_falsey
    end
  end

  describe "#crack!" do
    it "cracks open the fortune cookie if its unwrapped" do
      fortune.unwrap!
      fortune.crack!
      expect( fortune.cracked? ).to be_truthy
    end

    it "can't crack open if its wrapped" do
      fortune.crack!
      expect( fortune.cracked? ).to be_falsey
    end

  end

  describe "#read" do
    it "tells you to unwrap if still wrapped" do
      expect( fortune.read ).to eq("Unwrap me!")
    end


  #unwrapping twice below. so let's use context to group together "like" tests
    context "when the fortune cookie unwrapped" do
      before { fortune.unwrap! }

      it "tells you to crack if still uncracked" do
        # fortune.unwrap!
        expect( fortune.read ).to eq("Crack me!")
      end

      it "reads the fortune if unwrapped and cracked" do
        # fortune.unwrap!
        fortune.crack!
        expect( fortune.read ).to eq("Here is your fortune!")
      end
    end
  end



end
