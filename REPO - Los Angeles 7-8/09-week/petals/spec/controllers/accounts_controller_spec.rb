require 'rails_helper'

RSpec.describe AccountsController, :type => :controller do

	let :valid_attributes do
		{
			owner_name: 'starbucks',
			ig_account: 'starbucks'
		}
	end

	describe "GET #index" do
		let :account1 do
			Account.create! valid_attributes
		end
		let :account2 do
			Account.create! valid_attributes
		end

		before do
			get :index, format: :json
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign @accounts to be all of the accounts" do
			expect(assigns(:accounts)).to_json include(account1, account2)
		end
	end


end