require "spec_helper"
require_relative "../lib/change"


describe Change do
  describe "::new" do
    let (:change) {Change.new(56)}
    it "should make a new instance of Change" do
      expect(change.class).to eq(Change)
    end
    it "should take in and return initial money value" do
      expect(change.value).to eq(56)
    end
  end


end
