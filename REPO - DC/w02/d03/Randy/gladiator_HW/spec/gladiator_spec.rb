require 'spec_helper'
require_relative '../lib/gladiator'

describe "Gladiator" do
  describe "::new" do
    it "creates a new gladiator instance" do
      gladiator = Gladiator.new("Spartacus", "Trident")
    end
  end
end
