require 'spec_helper'

describe Person do
  describe "#caps" do
    it "should give you back the word and the capitalized word" do
      expect(Person.caps('anabel')).to eq(['anabel', 'Anabel'])
    end
  end

  describe "hair scopes" do
    before do
      @brown_haired_person = Person.create!(:hair_color => "brown")
      @blond_haired_person = Person.create!(:hair_color => "blond")
      @red_haired_person = Person.create!(:hair_color => "red")
      @black_haired_person = Person.create!(:hair_color => "black")
    end

    describe "#with_brown_hair" do
      it "should include only people with brown hair" do
        expect(Person.with_brown_hair).to include(@brown_haired_person)
      end
    end

    describe "#with_blonde_hair" do
      it "should include people with blonde hair" do
        expect(Person.with_blond_hair).to include(@blond_haired_person)
      end
    end

    describe "#with_red_hair" do
      it "should include people with red hair" do
        expect(Person.with_red_hair).to include(@red_haired_person)
      end
    end

    describe "#with_black_hair" do
      it "should include people with black hair" do
        expect(Person.with_black_hair).to include(@black_haired_person)
      end
    end
  end

  describe "the eyes scopes" do
    before do
      @blue_eyes = Person.create!(:eye_color => "blue")
      @brown_eyes = Person.create!(:eye_color => "brown")
      @green_eyes = Person.create!(:eye_color => "green")
    end

    describe ":with_blue_eyes" do
      it "should include people with blue eyes" do
        expect(Person.with_blue_eyes).to include(@blue_eyes)
      end
    end

    describe ":with_brown_eyes" do
      it "should include people with brown eyes" do
        expect(Person.with_brown_eyes).to include(@brown_eyes)
      end
    end

    describe ":with_green_eyes" do
      it "should include people with green eyes" do
        expect(Person.with_green_eyes).to include(@green_eyes)
      end
    end
  end

  describe "age scopes" do
    before do
      @age_24_person = Person.create(:age => 24)
      @age_39_person = Person.create(:age => 39)
    end

    describe "under_age" do
      it "should include only people under the given age" do
        expect(Person.under_age(30)).to include(@age_24_person)
        expect(Person.under_age(30)).to_not include(@age_39_person)
        expect(Person.under_age(20)).to_not include(@age_24_person)
      end
    end

    describe "over_age" do
      it "should include only people over the given age" do
        expect(Person.over_age(30)).to include(@age_39_person)
        expect(Person.over_age(30)).to_not include(@age_24_person)
        expect(Person.over_age(40)).to_not include(@age_39_person)
      end
    end
  end

end










