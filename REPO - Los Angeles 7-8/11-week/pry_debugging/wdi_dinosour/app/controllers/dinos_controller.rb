class DinosController < ApplicationController
	def index
		@dinos = Dino.all
		binding.pry
	end 
	def show
		@dino = Dino.find(params[:id])
	end
	def new
		@dino = Dino.new
	end
	def create
		@dino = Dino.new(params.require(:dino).permit(:name, :era, :weight, :horns, :diet))
		if @dino.save
			redirect_to dinos_path
		else
			render 'new'
		end
	end
	def edit
		@dino = Dino.find(params[:id])
	end

	def update
		@dino = Dino.find(params[:id])
		if @dino.update_attributes(params.require(:dino).permit(:name, :era, :weight, :horns, :diet))
			redirect_to dinos_path
		else
			render 'edit'
		end
	end
end
