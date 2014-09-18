require 'rails_helper'

RSpec.describe TurnsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the turns into @turns" do
      Turn.destroy_all
      turn1, turn2 = Turn.create!, Turn.create!

      get :index
      expect(assigns(:turns)).to match_array([turn1, turn2])
    end

  end

  describe "#new turn" do
    before(:each) do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }

  end

  describe "#create a turn" do
    before :each do
      @user = User.create!(name: 'jonny', email: "jono.kang@gmail.com",
                           github_handle: "coderjonny", password: 'asdfasdf',
                           password_confirmation: 'asdfasdf')
    end

    let :valid_attributes do
      {
        subject: 'supasdf',
        question: 'supasdf',
        user_id: @user.id
      }
    end

    it { should permit( :subject,
                        :question,
                        :user_id
                        ).for( :create )}

    it "should be add a turn for the user" do
      @turn = Turn.new(valid_attributes)

      post :create, turn: valid_attributes

      expect(Turn.last.user.name).to eq(@turn.user.name)
      expect(Turn.last.user_id).to eq(@user.id)
    end
    

  end
end
