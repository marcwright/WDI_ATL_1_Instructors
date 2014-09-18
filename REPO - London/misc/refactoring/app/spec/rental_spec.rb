require 'spec_helper'

describe Rental do
  before :each do
    @movie = Movie.new "Star Wars", Movie::REGULAR
    @rental = Rental.new @movie, 4
  end

  describe "#new" do
    it "takes two parameters and returns a Rental object" do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  describe "#movie" do
    it "returns the correct movie" do
      expect(@rental.movie).to eql @movie
    end
  end

  describe "#days_rented" do
    it "returns the correct days_rented" do
      expect(@rental.days_rented).to eql 4
    end
  end

end
