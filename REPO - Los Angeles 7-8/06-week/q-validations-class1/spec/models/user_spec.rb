require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:github_handle) }
  it { should have_many(:turns) }

  it { should validate_numericality_of(:age).on(:create, :update) }

  it { should respond_to(:age) }

end
