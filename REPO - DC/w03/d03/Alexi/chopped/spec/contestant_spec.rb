require 'spec_helper'

describe Ingredient do
  let(:ingredient) { Ingredient.new }
  # Attribute validation
  it { should validate_presence_of(:description) }
end

describe Contestant do
  let(:contestant) { Contestant.new }
  # Attribute validation
  it { should validate_presence_of(:name) }
  # Relationship validation
  it { should have_many(:rounds).through(:dishes) }
end

describe Round do
  let(:round) { Round.new }
  # Attribution validation
  it { should validate_presence_of(:title) }
  # Relationship validation
  it { should have_many(:ingredients) }
  it { should have_many(:contestants).through(:dishes) }
end

describe Dish do
  let(:dish) { Dish.new }
  # Attribute validation
  it { should validate_presence_of(:dish_name) }
  it { should validate_presence_of(:chopped) }
  # it { should BOOLEAN ??? }
end
