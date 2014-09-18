require 'spec_helper'
require_relative '../lib/word'

describe Word do

  describe "#original_word" do
    let(:word) { Word.new("bazinga") }

    it "has returns the original word" do
      expect( word.original_word ).to eq("bazinga")
    end
  end #-- ends #original_word

  describe "#piglatinize" do

    it "should add 'way' do the end of words that start with a vowel" do
      word = Word.new("aardvark")
      expect( word.piglatinize ).to eq("aardvarkway")
    end

    it "should move the initial consonant to the end and add 'ay' for words that begin with consonant sounds" do
      word = Word.new("manatee")
      expect( word.piglatinize ).to eq("anateemay")
    end

    it "should move the initial consonant cluster to the end and add 'ay' for words that begin with consonant sounds" do
      word = Word.new("chutney")
      expect( word.piglatinize ).to eq("utneychay")
    end

  end #-- ends #piglatinize

end #-- ends Word class
