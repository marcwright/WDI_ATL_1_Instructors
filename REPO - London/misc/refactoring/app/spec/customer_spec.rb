require 'spec_helper'

describe Customer do
  before :each do
    @customer = Customer.new "Fred"
    @regular_movie = Movie.new "Star Wars", Movie::REGULAR
    @new_release_movie = Movie.new "Red2", Movie::NEW_RELEASE
    @childrens_movie = Movie.new "Bambi", Movie::CHILDRENS
  end

  describe "#new" do
    it "takes two parameters and returns a Customer object" do
      expect(@customer).to be_an_instance_of Customer
    end
  end

  describe "#name" do
    it "returns the correct name" do
      expect(@customer.name).to eql "Fred"
    end
  end

  describe "#add_rental" do
    it "accepts new rentals" do
      regular_movie_rental = Rental.new(@regular_movie, 1)
      expect(@customer.add_rental(regular_movie_rental)).to eql [regular_movie_rental]
    end
  end

  context "for no movie rentals" do
    it "has zero owed" do
      expect(@customer.statement).to match(%r{^Amount owed is 0$})
    end

    it "has zero renter points" do
      expect(@customer.statement).to match(%r{^You earned 0 frequent renter points$})
    end

  end

  context "for REGULAR movie rentals" do

    context "it costs 2 for up to 2 nights" do
      it "costs 2 for 1 night" do
        regular_movie_rental = Rental.new(@regular_movie, 1)
        @customer.add_rental(regular_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 2$})
      end

      it "costs 2 for 2 nights" do
        regular_movie_rental = Rental.new(@regular_movie, 2)
        @customer.add_rental(regular_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 2$})
      end
    end

    context "it costs 1.5 per night for each night over 2 nights" do
      it "costs 3.5 for 3 nights" do
        regular_movie_rental = Rental.new(@regular_movie, 3)
        @customer.add_rental(regular_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 3.5$})
      end

      it "costs 5 for 4 nights" do
        regular_movie_rental = Rental.new(@regular_movie, 4)
        @customer.add_rental(regular_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 5.0$})
      end

      it "costs 8 for 6 nights" do
        regular_movie_rental = Rental.new(@regular_movie, 6)
        @customer.add_rental(regular_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 8.0$})
      end
    end

    context "it adds 1 to frequent renter points however long the rental" do
      it "has 1 frequent renter point for one night" do
        regular_movie_rental = Rental.new(@regular_movie, 1)
        @customer.add_rental(regular_movie_rental)
        expect(@customer.statement).to match(%r{^You earned 1 frequent renter points$})
      end

      it "has 1 frequent renter points for ten nights" do
        regular_movie_rental = Rental.new(@regular_movie, 10)
        @customer.add_rental(regular_movie_rental)
        expect(@customer.statement).to match(%r{^You earned 1 frequent renter points$})
      end
    end
  end

  context "for CHILDRENS movie rentals" do
    context "it costs 1.5 for up to 3 nights" do
      it "costs 1.5 for 1 night" do
        childrens_movie_rental = Rental.new(@childrens_movie, 1)
        @customer.add_rental(childrens_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 1.5$})
      end

      it "costs 1.5 for 2 nights" do
        childrens_movie_rental = Rental.new(@childrens_movie, 2)
        @customer.add_rental(childrens_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 1.5$})
      end

      it "costs 1.5 for 3 nights" do
        childrens_movie_rental = Rental.new(@childrens_movie, 3)
        @customer.add_rental(childrens_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 1.5$})
      end
    end

    context "it costs 1.5 per night for each night over 3 nights" do
      it "costs 3 for 4 nights" do
        childrens_movie_rental = Rental.new(@childrens_movie, 4)
        @customer.add_rental(childrens_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 3.0$})
      end

      it "costs 4.5 for 5 nights" do
        childrens_movie_rental = Rental.new(@childrens_movie, 5)
        @customer.add_rental(childrens_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 4.5$})
      end

      it "costs 6 for 6 nights" do
        childrens_movie_rental = Rental.new(@childrens_movie, 6)
        @customer.add_rental(childrens_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 6.0$})
      end
    end

    context "it adds 1 to frequent renter points however long the rental" do
      it "has 1 frequent renter point for one night" do
        childrens_movie_rental = Rental.new(@childrens_movie, 1)
        @customer.add_rental(childrens_movie_rental)
        expect(@customer.statement).to match(%r{^You earned 1 frequent renter points$})
      end

      it "has 1 frequent renter points for ten nights" do
        childrens_movie_rental = Rental.new(@childrens_movie, 10)
        @customer.add_rental(childrens_movie_rental)
        expect(@customer.statement).to match(%r{^You earned 1 frequent renter points$})
      end
    end
  end

  context "for NEW_RELEASE movie rentals" do
    context "it costs 3 per night" do
      it "costs 3 for 1 night" do
        new_release_movie_rental = Rental.new(@new_release_movie, 1)
        @customer.add_rental(new_release_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 3$})
      end

      it "costs 6 for 2 nights" do
        new_release_movie_rental = Rental.new(@new_release_movie, 2)
        @customer.add_rental(new_release_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 6$})
      end

      it "costs 12 for 4 nights" do
        new_release_movie_rental = Rental.new(@new_release_movie, 4)
        @customer.add_rental(new_release_movie_rental)
        expect(@customer.statement).to match(%r{^Amount owed is 12$})
      end
    end

    it "has 1 frequent renter point for one night" do
      new_release_movie_rental = Rental.new(@new_release_movie, 1)
      @customer.add_rental(new_release_movie_rental)
      expect(@customer.statement).to match(%r{^You earned 1 frequent renter points$})
    end

    it "has 2 frequent renter points for ten nights" do
      new_release_movie_rental = Rental.new(@new_release_movie, 10)
      @customer.add_rental(new_release_movie_rental)
      expect(@customer.statement).to match(%r{^You earned 2 frequent renter points$})
    end
  end

end
