require File.dirname(__FILE__) + "/spec_helper"
require 'golf'

describe "Golf" do


  # keep
  describe ".hole1" do
    it "should play raindrops to 3, where multiples of 3 are 'pling'" do
      expect(Golf.hole1(3)).to eql [1,2,"pling"]
    end

    it "should play raindrops to 5, with rules above and multiples of 5 are 'plang'" do
      expect(Golf.hole1(5)).to eql [1,2,"pling",4,"plang"]
    end

    it "should play raindrops to 7, with rules above and multiples of 5 are 'plong'" do
      expect(Golf.hole1(7)).to eql [1,2,"pling",4,"plang","pling","plong"]
    end

    it "should play raindrops to 10 with rules above and muliples of 3 and 5 are 'plingplang'" do
      expect(Golf.hole1(15)).to eql [1,2,"pling",4,"plang","pling","plong",8,"pling","plang",11,"pling",13,"plong","plingplang"]
    end

    it "should play raindrops to 30 with rules above and muliples of 3 and 7 are 'plingplong'" do
      expect(Golf.hole1(30)).to eql [1,2,"pling",4,"plang","pling","plong",8,"pling","plang",11,"pling",13,"plong","plingplang",16,17,"pling",19,"plang","plingplong",22,23,"pling","plang",26,"pling","plong",29,"plingplang"]
    end
  end

  describe ".hole2" do
    it "should take the first letter of a word and return it as a string." do
      expect(Golf.hole2("hello")).to eql "h"
    end

    it "should take the first letter of each word in a sentence and return them as a string." do
      expect(Golf.hole2("hello world it is a glorious day")).to eql "hwiiagd"
    end
  end

end

