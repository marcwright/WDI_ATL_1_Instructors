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
    it "places the consonant in the back of the word and returns it piglatinized" do
      word = Word.new("rest")
      expect( word.piglatinize ).to eq("estray")
    end

    it "if the word starts with a vowel, it puts the word and a w in front of the ay part" do
      word = Word.new("exit")
      expect( word.piglatinize ).to eq("exitway")
    end

    it "places consonant clusters on the latter part of the word." do
      word = Word.new("spotlight")
      expect( word.piglatinize ).to eq("optlightspay")
    end
  end


end
