require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("bazinga") }

    it "has returns the original word; " do
      expect( word.original_word ).to eq("bazinga")
    end
  end

  describe "#piglatinize" do
    let(:word2) { Word.new("egg") }

    it "returns 'way' at the end of words that start with vowels; " do
      expect( word2.piglatinize ).to eq("eggway")
    end


    let(:word3) { Word.new("happy") }
    
    it "shifts the first letter to the end and then adds 'way' for non-vowel words, like 'happy'; " do
      expect( word3.piglatinize ).to eq("appyhay")
    end



  end

end