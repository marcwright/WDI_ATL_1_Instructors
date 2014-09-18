require 'spec_helper'
require_relative '../lib/cipher'

describe Cipher do

  describe "::encode" do
    it "encodes the word 'hello'" do
      expect( Cipher.encode( "hello") ).to eq("uryyb")
    end

    it "encodes the word 'peter'" do
      expect( Cipher.encode( "peter") ).to eq("crgre")
    end

    it "encodes the sentence 'word up'" do
      expect( Cipher.encode( "word up") ).to eq("jbeq hc")
    end
    it "encodes the sentence 'inhak kim'" do
      expect( Cipher.encode( "inhak kim") ).to eq("vaunx xvz")
    end

    it "encodes the sentence 'Word up, Inhak.'" do
      expect( Cipher.encode( "Word up, Inhak.")).to eq("Jbeq hc, Vaunx.")
    end
  end

end
