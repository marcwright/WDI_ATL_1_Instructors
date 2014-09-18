require_relative '../make_change'

describe Transaction do

  describe "#make_change" do
    it "takes a number of cents as input and returns a number of quarters, dimes, nickels, and pennies" do
      transaction = Transaction.new
      expect( transaction.make_change(37) ).to eq({quarters: 1, dimes: 1, nickels: 0,pennies: 2})
    end

    it "takes a number of cents as input and returns a number of quarters, dimes, nickels, and pennies" do
      transaction = Transaction.new
      expect( transaction.make_change(7) ).to eq({quarters: 0, dimes: 0, nickels: 1,pennies: 2})
    end

    it "takes a number of cents as input and returns a number of quarters, dimes, nickels, and pennies" do
      transaction = Transaction.new
      expect( transaction.make_change(79) ).to eq({quarters: 3, dimes: 0, nickels: 0,pennies: 4})
    end

    it "returns an error if input is not an integer" do
      transaction = Transaction.new
      expect( transaction.make_change(17.97) ).to eq("Error!! Please input valid cent amount")
    end

    it "returns an error if input is not an integer" do
      transaction = Transaction.new
      expect( transaction.make_change("hello there!") ).to eq("Error!! Please input valid cent amount")
    end
  end #-- ends describe #make_change

  describe "#make_cents" do
    it "takes  a set of coins as input (pennies, nickels, dimes and quarters) and returns the total number of cents that they add up to" do
      transaction = Transaction.new
      expect( transaction.make_cents({quarters: 1, dimes: 1, nickels: 0,pennies: 2}) ).to eq(37)
    end
  end #-- ends describe #make_cents

end #-- ends describe Transaction
