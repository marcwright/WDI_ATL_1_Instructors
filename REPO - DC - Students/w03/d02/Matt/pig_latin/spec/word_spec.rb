require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("egg") }
    let(:word2) { Word.new("duck") }

    it "has returns the original word" do
      expect( word.original_word ).to eq("egg")
    end

    describe "#piglatinize" do

      context "when the word begins with a vowel" do

        it "adds way to a string that begins with a vowel sound or silent letter" do
          word.original_word
          expect( word.piglatinize ).to eq("eggway")
        end

      end
      context "when the word begins with a consonant" do

        it "can detect a consonant in a string and add day to the end" do
          word2.original_word
          word2.piglatinize
          expect( word2.piglatinize ).to eq("duckday")
        end

      end
  end

  end

end
