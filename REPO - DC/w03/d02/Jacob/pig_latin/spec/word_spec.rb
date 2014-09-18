require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("bazinga") }

    it "returns the original word" do
      expect( word.original_word ).to eq("bazinga")
    end
  end

  describe "#vowel?" do
    let(:word) {Word.new("alacrity")}

    it "returns the word plus 'way' on the end" do
      expect(word.vowel?).to eq("alacrityway")
    end
  end

  describe "#consonant" do
    let(:word) {Word.new("proverbial")}
    let(:word2) {Word.new("superfluous")}

    it "returns the pig latin version of the word when the first two letter are consonants" do
      expect(word.consonant?).to eq("overbialpray")
    end

    it "returns the pig latin version of the word when the first letter is a consonant" do
      expect(word2.consonant?).to eq("uperfluoussay")
    end
  end

end
