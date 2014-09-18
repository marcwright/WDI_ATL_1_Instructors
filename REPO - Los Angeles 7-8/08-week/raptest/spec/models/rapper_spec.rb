require 'rails_helper'

RSpec.describe Rapper, :type => :model do
  before { @rapper = Rapper.create!(name: 'Alfonso R aka Jedi Master Kosh', age: 42) }
  subject { @rapper }

  it { should respond_to(:name) }
  it { should respond_to(:age) }
  it { should have_many(:songs) }
  it { should validate_numericality_of(:age).is_greater_than_or_equal_to(42) }
  it { should validate_presence_of(:name).with_message('cannot rap without a name!') }
end
