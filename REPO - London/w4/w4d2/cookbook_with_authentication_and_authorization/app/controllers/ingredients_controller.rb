class IngredientsController < ApplicationController
  load_and_authorize_resource

  def create
    if @ingredient.save
      redirect_to @ingredient, :notice => "Successfully created ingredient."
    else
      render action: 'new'
    end
  end

  def update
    if @ingredient.update_attributes(params[:ingredient])
      redirect_to @ingredient, :notice  => "Successfully updated ingredient."
    else
      render action: 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_url, notice: "Successfully destroyed ingredient."
  end
end
