require_relative '../luhn_solution'

describe '#valid' do

  context "when given an invalid credit card number" do
    it "returns false" do
      expect(valid(1234567890123456)).to eq(false)
    end
  end

  context "when given a valid credit card number" do
    it "returns true" do
      expect(valid(4147202133188217)).to eq(true)
    end
  end

end
