require 'spec_helper'

describe Episode do
  describe " validate values for initial variables"
    it{should validate_presence_of(:epi_num)}
    it{should validate_presence_of(:season)}
    it{should validate_presence_of(:air_date)}
  describe "validate for episode's relationships."
    it{should have_many(:chefs)}
    it{should have_many(:rounds)}
    it{should have_many(:judgments)}
    it{should have_many(:judges)}
end
