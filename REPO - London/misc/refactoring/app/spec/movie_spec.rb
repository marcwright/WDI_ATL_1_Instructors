require 'spec_helper'

describe Movie do
  before :each do
    @movie = Movie.new "Star Wars", Movie::REGULAR
  end

  describe "#new" do
    it "takes two parameters and returns a Movie object" do
      expect(@movie).to be_an_instance_of(Movie)
    end
  end

  describe "#title" do
    it "returns the correct title" do
      expect(@movie.title).to eql "Star Wars"
    end
  end

  describe "#price_code" do
    it "returns the correct price_code" do
      expect(@movie.price_code).to eql Movie::REGULAR
    end
  end


end
