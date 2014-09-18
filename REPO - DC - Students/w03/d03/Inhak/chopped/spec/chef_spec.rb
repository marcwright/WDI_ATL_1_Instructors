require 'spec_helper'

describe Chef do
  describe "name validation" do
    it{should validate_presence_of(:name)}
  end
  describe "age validation" do
    it{should validate_presence_of(:age)}
  end
  it{should validate_presence_of(:gender)}
  describe "relationship validations" do
    it{should belong_to(:episode)}
    it{should have_many(:dishes)}
  end
end
