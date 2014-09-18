require "spec_helper"
require_relative "../lib/gladiator"
require_relative "../lib/arena"

describe Arena do
  let( :arena ) { Arena.new( "arena" )}
  let( :trident ) { Gladiator.new( "Blue Gladiator", "Trident" )}
  let( :club ) { Gladiator.new( "Yellow Gladiator", "Club" )}
  let( :spear ) { Gladiator.new( "Green Gladiator", "Spear" )}
  let( :maximus ) { Gladiator.new( "Maximus", "Bare Fists" )}
  let( :add_two_gladiators ) do
    arena.add_gladiator( blue )
    arena.add_gladiator( yellow )
  end


  describe "::new" do
    it "starts with a capitalized name" do
      expect( arena.name ).to eq( "Arena" )
    end
  end # ends describe "::new"

  describe "#add_gladiator" do
    it "can have gladiators" do
      arena.add_gladiator( trident )
      expect( arena.gladiators[0] ).to eq( trident )
    end

    context "when there are two gladiators" do
      before do
        arena.add_gladiator( trident )
        arena.add_gladiator( club )
      end

      it "does not add anymore gladiators" do
        arena.add_gladiator( spear )
        expect( arena.gladiators ).to eq([trident, club])
      end
    end # ends context "when there are two gladiators"
  end # ends describe "#add gladiator"

  describe "#fight" do
    context "when there are two fighters" do
      before do
        arena.add_gladiator( trident )
        arena.add_gladiator( club )
      end

      it "eliminates one fighter" do
        arena.fight
        expect( arena.gladiators.length ).to eq(1)
      end
    end # end context "when there are two fighters"

    context "when two fighters both have the same weapon" do
      before do
        arena.add_gladiator( trident )
        arena.add_gladiator( trident )
      end

      it "eliminates both fighters" do
        arena.fight
        expect( arena.gladiators.empty? ).to be_truthy
      end
    end # end context "same weapon fighters"

    context "when there is a trident fighter and spear fighter in the arena" do
      before do
        arena.add_gladiator( trident )
        arena.add_gladiator( spear )
      end

      it "eliminates the spear fighter" do
        arena.fight
        expect( arena.gladiators ).to eq([ trident ])
      end
    end # end context "spear + trident fighter"

    context "when there is a spear fighter and club fighter in the arena" do
      before do
        arena.add_gladiator( spear )
        arena.add_gladiator( club )
      end

      it "eliminates the club fighter" do
        arena.fight
        expect( arena.gladiators ).to eq([ spear ])
      end
    end # end context "spear + club fighter"

    context "when there is a club fighter and trident fighter in the arena" do
      before do
        arena.add_gladiator( club )
        arena.add_gladiator( trident )
      end

      it "eliminates the trident fighter" do
        arena.fight
        expect( arena.gladiators ).to eq([ club ])
      end
    end # end context "club + trident fighter"

    context "when there is a fighter named 'Maximus'" do
      before do
        arena.add_gladiator( maximus )
        arena.add_gladiator( trident )
      end

      it "will eliminate Maximus's opponent" do
        arena.fight
        expect( arena.gladiators ).to eq([ maximus ])
      end
    end # end context "fighter named maximus"

    context "when a fighter is about to be eliminated" do
      before do
        arena.add_gladiator( club )
        arena.add_gladiator( trident )
        arena.fight
      end

      it "will eliminate the winning fighter if the user votes thumbs up" do
        arena.expect( arena.gladiators ).to eq( trident )
      end

      it "will eliminate the losing fighter if the user votes thumbs down" do
        arena.expect( arena.gladiators ).to eq( club )
      end
    end # context "when a fighter is about to be eliminated"
  end # ends describe "#fight"

  describe "#remove_name" do
    it "removes a gladiator by name" do
      arena.add_gladiator( trident )
      arena.remove_name( "Blue Gladiator" )
      expect( arena.gladiators.empty? ).to be_truthy
    end

    it "will eliminate a gladiator regardless of case" do
      arena.add_gladiator( trident )
      arena.remove_name( "blue gladiator" )
      expect( arena.gladiators.empty? ).to be_truthy
    end

    it "will elimiante all gladiators with that name" do
      arena.add_gladiator( trident )
      arena.add_gladiator( trident )
      arena.remove_name( "blue gladiator" )
      expect( arena.gladiators.empty? ).to be_truthy
    end
  end # ends describe "#remove_name"

  describe "#entertained?" do
    context "when Maximus is not present" do
      it "will return false" do
        expect( arena.entertained? ).to be_falsy
      end
    end

    context "when Maximus is present" do
      before { arena.add_gladiator( maximus )}
      it "will return true" do
        expect( arena.entertained? ).to be_truthy
      end
    end
  end
end # ends describe "Arena"
