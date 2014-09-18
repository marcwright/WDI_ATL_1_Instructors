require "spec_helper"
require_relative "../lib/make_change"

describe MoneyChanger do
  let(:money_changer) { MoneyChanger.new }

  describe "#make_change" do
    it "makes change for 1 cent" do
      expect(money_changer.make_change(1)).to eq({penny: 1})
    end

    it "makes change for 26 cents" do
      expect(money_changer.make_change(26)).to eq({quarter: 1, penny: 1})
    end

    it "only takes positive integers" do
      expect(money_changer.make_change(-1)).to be_falsy
    end
  end
end