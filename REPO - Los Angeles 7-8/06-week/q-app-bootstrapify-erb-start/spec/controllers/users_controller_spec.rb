require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:valid_attributes) {
    {
      name: 'jonny',
      email: 'jono.kang@gmail.com',
      github_handle: 'coderjonny',
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf'
    }
  }

  describe "GET new" do
    before(:each) do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  describe "POST create a new user " do
    describe "with valid params" do
      it "create a new user" do
        expect {

          post :create, {:user => valid_attributes}

        }.to change(User, :count).by(1)

      end
    end
  end

end
