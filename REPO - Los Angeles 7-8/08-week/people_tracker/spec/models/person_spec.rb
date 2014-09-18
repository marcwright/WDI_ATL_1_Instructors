require 'spec_helper'

describe Person do
  describe "hair scopes" do
    before do
      @brown_haired_person = Person.create!(:hair_color => "brown")
      @blond_haired_person = Person.create!(:hair_color => "blond")
      @red_haired_person = Person.create!(:hair_color => "red")
      @black_haired_person = Person.create!(:hair_color => "black")
    end

    describe "with_brown_hair" do
      it "should include only people with brown hair" do
        expect(Person.with_brown_hair).to include(@brown_haired_person)
        expect(Person.with_brown_hair).to_not include(@blond_haired_person)
        expect(Person.with_brown_hair).to_not include(@red_haired_person)
        expect(Person.with_brown_hair).to_not include(@black_haired_person)
      end
    end

  end
end
