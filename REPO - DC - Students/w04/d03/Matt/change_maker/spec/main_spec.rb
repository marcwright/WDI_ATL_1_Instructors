require_relative '../lib/main'

describe Change do

  describe "::new" do

    it "should accept money" do
      change1 = 0.75
      expect( change1 ).to eq(0.75)
    end

  end

  describe "#return_change" do

    it "should tell you how many quarters you have" do
      change1 = 0.75
      expect( change1.return_change ).to eq(3)
    end

  end

end
