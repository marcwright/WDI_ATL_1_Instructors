require_relative '../lib/arena'

describe Arena do
  let (:arena) { Arena.new("coliseum") }

  describe "::new" do
    it "should have a name" do
      expect( arena.name ).to be_truthy
    end

    it "should have a capitalized name" do
      expect( arena.name ).to eq(arena.name.capitalize)
    end
  end #--ends describe ::new

  describe "#add_gladiator" do
    let ( :gladiator1 ){ Gladiator.new("Joseph","spear") }

    context "when the arena will have at least one gladiator" do
      before do
        arena.add_gladiator(gladiator1)
      end

      it "should add a gladiator to an empty arena" do
        expect( arena.gladiators ).to eq([gladiator1])
      end

      it "should add a gladiator if one is already present" do
        gladiator2 = Gladiator.new("Brutus","spear")
        arena.add_gladiator(gladiator2)
        expect( arena.gladiators ).to eq([gladiator1,gladiator2])
      end

      it "should NOT add a gladiator if two are already present" do
        gladiator2 = Gladiator.new("Brutus","spear")
        arena.add_gladiator(gladiator2)
        gladiator3 = Gladiator.new("Antony","spear")
        arena.add_gladiator(gladiator3)
        expect( arena.gladiators ).to eq([gladiator1,gladiator2])
      end

      it "should also give an error if two are already present" do
        gladiator2 = Gladiator.new("Brutus","spear")
        arena.add_gladiator(gladiator2)
        gladiator3 = Gladiator.new("Antony","spear")
        expect( arena.add_gladiator(gladiator3) ).to eq("Only two at a time!")
      end
    end #-- ends context of >1 gladiator
  end #--ends describe #add_gladiator

  describe "#fight" do
    it "should return error if two gladiators aren't present" do
      expect( arena.fight ).to eq("Must have two gladiators to fight!")
    end

    context "when there are two gladiators present in arena" do
      let ( :gladiator_s ){ Gladiator.new("Joseph","spear") }
      let ( :gladiator_t ){ Gladiator.new("Brutus","trident") }
      let ( :gladiator_c ){ Gladiator.new("Brutus","club") }

      it "should eliminate one of the gladiators from the arena" do
        arena.add_gladiator(gladiator_s)
        arena.add_gladiator(gladiator_t)
        arena.fight
        expect( arena.gladiators.length ).to eq (1)
      end

      it "should have trident beat spear" do
        arena.add_gladiator(gladiator_t)
        arena.add_gladiator(gladiator_s)
        arena.fight
        expect( arena.gladiators ).to eq([gladiator_t])
      end

      it "should have spear beat club" do
        arena.add_gladiator(gladiator_c)
        arena.add_gladiator(gladiator_s)
        arena.fight
        expect( arena.gladiators ).to eq([gladiator_s])
      end

      it "should have club beat trident" do
        arena.add_gladiator(gladiator_c)
        arena.add_gladiator(gladiator_s)
        arena.fight
        expect( arena.gladiators ).to eq([gladiator_s])
      end

      it "should eliminate both if same weapon" do
        gladiator_c2 = Gladiator.new("Caesar","club")
        arena.add_gladiator(gladiator_c)
        arena.add_gladiator(gladiator_c2)
        arena.fight
        expect( arena.gladiators ).to eq([])
      end
    end #--ends context 2 gladiators present
  end #--ends describe #fight

  describe "#delete_gladiator" do
    it "should remove a gladiator from the arena by name" do
      gladiator1 = Gladiator.new("Maximus","club")
      gladiator2 = Gladiator.new("Brutus","spear")
      arena.add_gladiator(gladiator1)
      arena.add_gladiator(gladiator2)
      arena.delete_gladiator(gladiator1)
      expect( arena.gladiators ).to eq([gladiator2])
    end
  end #--ends describe #delete_gladiator

  describe "#entertained?" do
    it "should be true if Maximus is in arena" do
      gladiator1 = Gladiator.new("Maximus","club")
      gladiator2 = Gladiator.new("Brutus","spear")
      arena.add_gladiator(gladiator1)
      arena.add_gladiator(gladiator2)
      expect( arena.entertained? ).to be_truthy
    end

    it "should be false if Maximus is not in arean" do
      gladiator1 = Gladiator.new("Nero","club")
      gladiator2 = Gladiator.new("Brutus","spear")
      arena.add_gladiator(gladiator1)
      arena.add_gladiator(gladiator2)
      expect( arena.entertained? ).to be_falsey
    end
  end #--ends describe #entertained?

end #--ends describe Arena class
