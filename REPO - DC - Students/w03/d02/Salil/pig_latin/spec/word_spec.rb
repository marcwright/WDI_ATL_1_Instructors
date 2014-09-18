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
    context "a word beginning with a consonant" do
      let(:word) { Word.new("bazinga") }
      it "piglatinizes a word beginning with consonant" do
        expect(word.piglatinize). to eq("azingabay")
      end
    end

    context "a word beginning with a vowel" do
      let(:word) {Word.new("egg")}
      it "piglatinizes a word begining with a vowel" do
        expect(word.piglatinize). to eq("eggway")
      end
    end
  end
end
