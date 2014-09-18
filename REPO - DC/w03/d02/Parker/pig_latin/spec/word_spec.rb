# Trying to write Method in ruby that will translate a string in pig-latin , the rule : Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.

# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word and also when the word begins with 2 consonants , move both to the end of the word and add an "ay"

require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("bazinga") }

    it "has returns the original word" do
      expect( word.original_word ).to eq("bazinga")
    end
   end
   
end