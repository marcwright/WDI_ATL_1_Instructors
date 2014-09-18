class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    Ingredient.all.each do |ingredient|
      @recipe.ingredients_recipes.build(ingredient_id: ingredient.id)
    end
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    #TODO: Find out why empty quantities are still getting saved on create
    if ir = params[:recipe][:ingredients_recipes_attributes]
      ir.delete_if do |key, value|
        ir[key]['quantity'].blank?
      end
    end

    if @recipe.save
      redirect_to @recipe, :notice => "Successfully created recipe."
    else
      Ingredient.all.each do |ingredient|
        @recipe.ingredients_recipes.build(ingredient_id: ingredient.id)  unless @recipe.ingredients_recipes.map(&:ingredient_id).include?(ingredient.id)
      end
      render :action => 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    Ingredient.all.each do |ingredient|
      @recipe.ingredients_recipes.build(ingredient_id: ingredient.id) unless @recipe.ingredients.include?(ingredient)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if ir = params[:recipe][:ingredients_recipes_attributes]
      ir.keys.each do |key|
        ir[key]['_destroy'] = true if ir[key]['quantity'].blank?
      end
    end

    if @recipe.update_attributes(params[:recipe])
      redirect_to @recipe, :notice  => "Successfully updated recipe."
    else
      Ingredient.all.each do |ingredient|
        @recipe.ingredients_recipes.build(ingredient_id: ingredient.id) unless @recipe.ingredients.include?(ingredient)
      end
      render :action => 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url, :notice => "Successfully destroyed recipe."
  end

end
