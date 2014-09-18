require 'rails_helper'

RSpec.describe User, :type => :model do
  #it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:github_handle) }
  it { should have_many(:turns) }
end
