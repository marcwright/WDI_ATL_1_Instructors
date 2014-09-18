require 'spec_helper'
require_relative '../lib/word'

describe Word do
  describe "#original_word" do
    let(:word) { Word.new("bazinga") }
    it "has returns the original word" do
      expect( word.original_word ).to eq("bazinga")
    end
  end #End desc #original_word

  describe "#pig_latinize" do
    context "When the word starts with a vowel" do
      let(:word){Word.new("Omaha")}

      it "should add 'way' to the end of the word" do
        expect( word.pig_latinize ).to eq("omahaway")
      end
    end #End Context Block

    context "When the word starts with a consonant" do
      let(:word){Word.new("Cheese")}

      it "should take the first consonant(s) and moves them to the end of the word and adds 'ay'" do
        expect(word.pig_latinize).to eq("eesechay")
      end


    end #End context block

  end #ENd desc #pig_latinize
end #END desc Word
