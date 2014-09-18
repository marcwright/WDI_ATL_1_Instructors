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
    context "when the word begins with a vowel" do
      let(:word) { Word.new("egg") }
      it "should return the original word + 'way'" do
        expect( word.piglatinize ).to eq("eggway")
      end
    end

    context "when the word begins with a consonant" do

      it "should return the original word, with the first consonant cluster moved to the end and 'ay' appended to it" do
        word = Word.new("trap")
        expect( word.piglatinize ).to eq("aptray")
      end

      it "should treat 'y' as a consonant if it is the first letter in the word" do
        word = Word.new("yellow")
        expect( word.piglatinize ).to eq("ellowyay")
      end

      it "should treat 'y' as a vowel if it is not the first letter in the word" do
        word = Word.new("rhythm")
        expect( word.piglatinize ).to eq("ythmrhay")
      end
    end
  end

end
