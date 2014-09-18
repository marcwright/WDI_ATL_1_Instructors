require "spec_helper"
require_relative "../lib/cipher"

describe Cipher do

  describe "::encode" do
    it "encodes the word 'hello'" do
      expect( Cipher.encode( "hello") ).to eq("uryyb")
    end

    it "encodes the word 'Hello, Peter!'" do
      expect( Cipher.encode( "Hello, Peter!" ) ).to eq("Uryyb, Crgre!")
    end
  end

  describe "::decode" do
    it "decodes the word 'uryyb'" do
      expect( Cipher.decode( "uryyb" ) ).to eq("hello")
    end

    it "decodes the word 'Uryyb, Crgre!'" do
      expect( Cipher.decode( "Uryyb, Crgre!" ) ).to eq("Hello, Peter!")
    end
  end

end
