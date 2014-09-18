require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("bazinga") }

    it "has returns the original word" do
      expect( word.original_word ).to eq("bazinga")
    end
  end

  describe "#piglatinize" do
    let (:word) {Word.new("inbox")}
    let (:word) {Word.new("train")}

    it "adds 'way' to the end of words beginning with vowels" do
      expect(word.piglatinize("inbox")).to eq("inboxway")
    end

    it "piglatinizes words not beginning in vowels" do
      expect(word.piglatinize("train")).to eq("raintay")
    end
  end

end
