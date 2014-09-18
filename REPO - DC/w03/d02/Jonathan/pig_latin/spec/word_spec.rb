require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("bazinga") }

    it "returns the original word" do
      expect( word.original_word ).to eq("bazinga")
    end
  end

  describe "#recognize a word that begin with vowel sounds" do
    let(:word) { Word.new("egg") }

    it "recognizes the letter e" do
      expect ( letter.starts_with_vowel ).to eq ("e")
    end
  end



end
