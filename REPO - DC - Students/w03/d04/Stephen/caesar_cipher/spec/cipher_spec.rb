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

    it "encodes the word 'zap'" do
      expect( Cipher.encode( "zan") ).to eq("mna")
    end

    # it "encodes words with spaces" do
    #   expect( Cipher.encode( "pe ter") ).to eq("cr gre")
    # end
  end

end
