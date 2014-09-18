require 'spec_helper'

describe YogurtsController do
	let :valid_attributes do
		{
			flavor: 'lime',
			topping: 'avocado',
			quantity: 5
		}
	end

	describe "GET #index" do
		let :froyo1 do
			Yogurt.create! valid_attributes
		end
		let :froyo2 do
			Yogurt.create! valid_attributes
		end

		before do
			get :index
		end

		it "should render the index template" do
			expect(response).to render_template :index
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign @froyos to be all yogurts" do
			expect(assigns(:froyos)).to include(froyo1, froyo2)
		end

	end


	describe "GET show" do
		before do
		  @yogurt = Yogurt.create! valid_attributes
		  get :show, id: @yogurt.id
		end

		it "should render the index template" do
		  expect(response).to render_template :show
		end

		it "should succeed" do
		  expect(response).to be_success
		end

		it "should assign yogurts to all yogurts" do
			expect(assigns(:froyo)).to eq(@yogurt)
		end
	end


	describe "Get new" do
		before do
			get :new
		end

		it "should render new template successfully " do
			expect(response).to render_template :new
			expect(response).to be_success
		end

		it "should make froyo a new Yogurt" do
			expect(assigns(:froyo)).to be_a(Yogurt)
			expect(assigns(:froyo)).to_not be_persisted
		end
	
	end

	describe "POST create" do
			
		describe " a successful create " do
			it "should create a froyo in the DB" do
				expect do
					post :create, yogurt: valid_attributes
				end.to change(Yogurt, :count).by(1)
		 	end
		end
	end

	describe "Get edit" do
		before do
			@test_froyo = Yogurt.create! valid_attributes
			get :edit, id: @test_froyo.id
		end

		it "should render the edit template" do
		  expect(response).to render_template :edit
		  expect(response).to be_success
		end

		it "should assign the froyo " do
			expect(assigns(:froyo)).to eq(@test_froyo)
		end
	end

	describe "put/patch update" do
		before do
	      @test_yogurt = Yogurt.create! valid_attributes
	    end

	    describe "with successful update" do
	      let :new_attributes do
	        {
	          :flavor => "marshmellow",
	          :topping => "mochi balls",
	          :quantity => 6.0
	        }
	      end

	      before do
	        patch :update, id: @test_yogurt.id,
	        yogurt: new_attributes
	      end

	      it "should update the yogurt record in the database" do
	        expect(@test_yogurt.reload.quantity).to eq(6.0)
	      end

	      it "should redirect to the index of all yogurts" do
	        expect(response).to redirect_to yogurts_path
	      end
	    end
	    describe "with invalid update attributes" do
	      let :invalid_update_attributes do
	        {
	          :flavor => "chocolate",
	          :topping => "sprinkles",
	          :quantity => 25.0
	        }
	      end

	      before do
	        put :update, id: @test_yogurt.id, yogurt: invalid_update_attributes
	      end

	      it "should not update the yogurt record in the database" do
	        expect(@test_yogurt.reload.quantity).to eq(5)
	      end

	      it "should rerender the edit view template" do
	        expect(response).to render_template :edit
	      end
	    end
	end

	describe "delete #destroy" do
		before do
			@test_froyo = Yogurt.create! valid_attributes
		end

		it "should delete a froyo in the DB" do
			expect do
				delete :destroy, id: @test_froyo.id
			end.to change(Yogurt, :count).by(-1)
			expect(response).to redirect_to yogurts_path
	 	end

	end

end




