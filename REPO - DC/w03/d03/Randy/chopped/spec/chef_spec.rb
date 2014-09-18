require 'spec_helper'

describe Chef do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:home_town)}
  it { should validate_presence_of(:fav_food)}
  it { should validate_numericality_of(:age).only_integer }
  it { should have_many(:dishes) }
  it { should have_many(:scores).through(:dishes) }
  it { should have_many(:judges).through(:scores) }
end
