require 'spec_helper'
require_relative '../lib/word'

# describe Word do
#   describe "#original_word" do
#     let(:word) { Word.new("bazinga") }

#     it "has returns the original word" do
#       expect( word.original_word ).to eq("bazinga")
#     end

#   end

describe PigLatin do
  
  # Describing new method
  describe "#pig_vowel" do
    let(:word) { PigLatin.new("egg") }
    # Add the string "way" to the end of all words with vowels
    

    it "appends the word 'way' to the end of all words with vowels" do
      expect( word.pig_vowel ).to eq("eggway")
    end
  end # END pig_vowel method

  describe "#pig_consonant" do
    let(:word) { PigLatin.new("duck") }
    it "moves the first letter of words with consonants to the end of a word and then appends 'ay'. " do
      expect( word.pig_consonant ).to eq("uckday")
    end
  end # END pig_consonant method

end # END of Word class
