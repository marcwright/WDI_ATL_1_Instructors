class CategoriesController < ApplicationController
  load_and_authorize_resource

  def create
    if @category.save
      redirect_to @category, :notice => "Successfully created category."
    else
      render action: 'new'
    end
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to @category, notice: "Successfully updated category."
    else
      render action: 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Successfully destroyed category."
  end
end
