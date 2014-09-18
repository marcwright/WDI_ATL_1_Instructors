class YogurtsController < ApplicationController

	def index
		@froyos = Yogurt.all
	end

	def show
		@froyo = Yogurt.find(params[:id])
	end

	def new	
		@froyo = Yogurt.new
	end

	def create
		@froyo = Yogurt.new(yogurt_params)

		if @froyo.save
			redirect_to yogurts_path
		else
			render :new
		end
	end

	def edit
		@froyo = Yogurt.find(params[:id])
	end

	 def update
	 	@froyo = Yogurt.find(params[:id])

	    if @froyo.update(yogurt_params)
	      redirect_to yogurts_path
	    else
	      render 'edit'
	    end
	end

	def destroy
		@froyo = Yogurt.find(params[:id])
		@froyo.destroy
		redirect_to yogurts_path
	end


	protected

	def yogurt_params
		params.require(:yogurt).permit(:flavor, :topping, :quantity)
	end


end