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
    context "If the word begins with a vowel" do
      it "adds 'way' to the end of the word" do
        word = Word.new("egg")
        expect(word.piglatinize).to eq("eggway")
      end
    end
    context "If the word begins with a consonant" do
      it "The initial consonant or consonant cluster is moved to the end of the word, and 'ay' is added" do
        word = Word.new("glove")
        expect(word.piglatinize).to eq("oveglay")
      end
    end
  end

end
