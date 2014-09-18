require_relative '../water_bottle'

describe WaterBottle do

  let ( :bottle) { WaterBottle.new }

  describe "::new" do
    it "is empty when created" do
      expect( bottle.empty? ).to be_truthy
    end
  end #--describe ::new

  context "when the water bottle is filled" do
    before { bottle.fillit! }

    describe "#fillit!" do
      it "fills the water bottle when its empty" do
        expect( bottle.empty? ).to be_falsey
      end
    end #--describe #fillit

    context "when the water bottle is dispensed at least once" do
      before { bottle.dispense1 }

      describe "#dispense" do
        it "can dispense water" do
          expect( bottle.can_dispense? ).to be_truthy
        end

        it "bottle will not be empty after dispensed once" do
          expect( bottle.empty? ).to be_falsey
        end

        context "when the water bottle is dispensed at least twice" do
          before { bottle.dispense2 }

          it "bottle will not be empty after dispensed twice" do
            expect( bottle.empty? ).to be_falsey
          end

          it "bottle will be empty after being dispensed three times" do
            bottle.dispense3
            expect( bottle.empty? ).to be_truthy
          end

          it "cannot dispense water if bottle is  empty" do
            bottle.dispense3
            expect( bottle.can_dispense? ).to be_falsey
          end

        end #-- context #dispense2

      end #--describe #dispense

    end #-- context #dispense1

  end #-- context #fillit!

end #--describe WaterBottle


