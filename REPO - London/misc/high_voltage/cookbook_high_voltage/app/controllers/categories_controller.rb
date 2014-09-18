class CategoriesController < ApplicationController

def index
    @categories = Category.all
  end

def show
  @category = Category.find(params[:id])
 
end  

def new
  @category = Category.new
end  


def create
  @category.create(params[:category])
  if @category.save
      redirect_to @category, :notice => "Successfully created category."
    else
      render :action => 'new'
    end
end

def edit
  @category = Category.find(params[:id])
end 

def destroy
  @category = Category.find(params[:id])
  @category.destroy
  
  redirect_to(categories_path)
  end

def update

  @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to @category, :notice  => "Successfully updated category."
    else
      render :action => 'edit'
    end
end








end
