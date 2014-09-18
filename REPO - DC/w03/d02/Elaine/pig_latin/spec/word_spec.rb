require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("bazinga") }

    it "returns the original word" do
      expect( word.original_word ).to eq("bazinga")
    end
  end

  describe "#piglatinize" do
    let(:word1) { Word.new("egg") }
    let(:word2) { Word.new("hour") }
    let(:word3) { Word.new("happy") }
    let(:word4) { Word.new("glove") }

    it "returns the original word plus 'way' for words that begin with vowels" do
      expect( word1.piglatinize ).to eq("eggway")
    end

    it "should return the original word plus 'way' for words that begin with vowel sounds or a silent letter" do
      expect( word2.piglatinize ).to eq("hourway")
    end

    it "should return the word with the initial consonant moved to the end plus 'ay' for words that begin with consontants" do
      expect( word3.piglatinize ).to eq("appyhay")
    end

    it "should return the word with the initial consonant cluster moved to the end plus 'ay' for words that begin with consontants" do
      expect( word4.piglatinize ).to eq("oveglay")
    end

  end

end
