require_relative '../lib/arena'

describe Arena do
let (:arena) { Arena.new("colosseum") }

  describe "::new" do
    it "sets the arena's name and capitalizes" do
      expect( arena.name ).to eq "Colosseum"
    end
  end

  describe "#add_gladiator!" do
    it "adds a gladiator to the arena" do
      arena.add_gladiator!("Vorenus", "sword")
      expect( arena.gladiators.last.name ).to eq "Vorenus"
    end
    it "there can only be two gladiators in the arena at a time" do
      arena.add_gladiator!("Vorenus", "sword")
      arena.add_gladiator!("Pullo", "axe")
      arena.add_gladiator!("Maximus", "fists")
      expect( arena.gladiators.length ).to eq(2)
    end
  end

  describe "#fight!" do
    context "If there are two gladiators in the arena, you can call a fight method that results in the elimination of one of the gladiators from the arena." do
      it "need two gladiators" do
        arena.add_gladiator!("Vorenus", "sword")
        arena.add_gladiator!("Pullo", "axe")
        arena.fight!
        expect( arena.gladiators.length ).to eq(1)
      end

      it "Trident beats Spear" do
        arena.add_gladiator!("Vorenus", "trident")
        arena.add_gladiator!("Pullo", "spear")
        arena.fight!
      end

      it "Spear beats Club" do
        arena.add_gladiator!("Vorenus", "spear")
        arena.add_gladiator!("Pullo", "club")
        arena.fight!
      end

      it "Club beats Trident" do
        arena.add_gladiator!("Vorenus", "club")
        arena.add_gladiator!("Pullo", "trident")
        arena.fight!
      end

      it "if same weapon, both gladiators are elinminated" do
        arena.add_gladiator!("Vorenus", "trident")
        arena.add_gladiator!("Pullo", "trident")
        arena.fight!
        expect(@gladiators.length).to eq(0)
      end
      end
    end
end
