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

    it "encodes a string of words" do
      expect( Cipher.encode( "inhak kim") ).to eq("vaunx xvz")

    end
  end

end
