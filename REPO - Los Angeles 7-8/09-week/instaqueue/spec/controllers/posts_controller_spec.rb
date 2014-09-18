require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
	let :valid_attributes do
	{
		caption: "#coding",
		location: "santa monica",
		release_date: Time.new
	}
	end

	describe "GET #index" do
		let :post1 do
			Post.create! valid_attributes
		end
		let :post2 do
			Post.create! valid_attributes
		end

		before do
			get :index, format: :json
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign @posts to be all of the posts" do
			expect(assigns(:posts)).to_json include(post1, post2)
		end

		it "should put out json" do
			get '/api/posts', action: 'index'
		    json = JSON.parse(response.body)
		end

	end

	describe "Messages API" do
				let :post1 do
			Post.create! valid_attributes
		end
	  it 'sends a list of messages' do


	    get :index, format: :json

	    expect(response).to be_success            # test for the 200 status-code
	    json = JSON.parse(response.body)
	    expect(json['messages'].length).to eq(10) # check to make sure the right amount of messages are returned
	  end
	end
end

