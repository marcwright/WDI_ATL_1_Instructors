require 'spec_helper'
require 'shoulda/matchers'

describe User do
  before do
    @user = User.new(
      name: 'Example User', 
      email: 'user@example.com', 
      password: 'password',
      password_confirmation: 'password'
    )
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

  describe '#name' do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_most(50) }
  end

  describe '#email' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('email@address.com', 'First.Last@domain.co').for(:email) }
    it { should_not allow_value('foobar', 'foo@bar').for(:email) }
  end

  describe '#password' do
    it { should validate_confirmation_of(:password) }
    it { should ensure_length_of(:password).is_at_least(8) }
  end

  describe '#remember_token' do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe '#authenticate' do
    before { @user.save }
    let(:signin_user) { User.find_by(email: @user.email) }

    it 'should not authenticate when password is invalid' do
      expect(signin_user.authenticate('garbage')).to be_falsy
    end

    it 'should authenticate when password is valid' do
      expect(signin_user.authenticate(@user.password)).to be_truthy
    end
  end
end
