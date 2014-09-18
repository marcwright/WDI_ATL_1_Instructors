require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("bazinga") }

    it "has returns the original word" do
      expect( word.original_word ).to eq("bazinga")
    end
  end

  describe "#piglatin_converter" do


    it "returns the original word with 'way' added to the end if it begins with a vowel" do
      word = Word.new("Inhak")
      expect( word.piglatin_converter ).to eq("Inhakway")
    end

    it  "returns the original word with the first letter moved to the end and the word 'ay' added to it." do
      word = Word.new("Travis")
      expect( word.piglatin_converter ).to eq("avistray")
    end

    it "moves the first letter, if it is a consonant, to the end of the word and appends 'ay'." do
      word = Word.new('Richard')
      expect( word.piglatin_converter ).to eq("ichardray")
    end

    it "returns the original word with everything beginning before 'qu' at the end of the word, followed by 'ay'" do
      word = Word.new("Squash")
    end
  end

end
