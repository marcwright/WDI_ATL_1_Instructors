# RAILSCAFE3

class BeansController < ApplicationController

	def index
		my_bean_filter = params[:beanfilter]
		case my_bean_filter
		when "showall"
		  @beans = Bean.all
		when "dark"
			@beans = Bean.where(:roast => "dark")
		when "light"
			@beans = Bean.where(:roast => "light")
		when "instock"
			@beans = Bean.where(:quantity.gt => 0)
		else
		  @beans = Bean.all
		end
	end

	def show
		@bean = Bean.find(params[:id])
	end

	def new
		@bean = Bean.new
	end

	def create 
		@bean = Bean.new(params.require(:bean).permit(:name, :roast, :origin, :quantity))
		if @bean.save
			redirect_to beans_path
		else
			render 'new'
		end
	end

	def edit
		@bean = Bean.find(params[:id])
	end

	def update
		@bean = Bean.find(params[:id])
		if @bean.update_attributes(params.require(:bean).permit(:name, :roast, :origin, :quantity))
			redirect_to beans_path
		else
			render 'edit'
		end
	end

	def destroy
		@bean = Bean.find(params[:id])
		@bean.destroy
		redirect_to beans_path
	end
end
