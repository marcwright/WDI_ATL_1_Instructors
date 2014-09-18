class RecipesController < ApplicationController

  before_filter :authenticate, except: [:show, :index]

  load_and_authorize_resource

  def index
    #@recipes = Recipe.all
  end

  def new
    #@recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(params[:recipe])
    redirect_to(recipe)
  end

  def show
    #@recipe = Recipe.find(params[:id])
  end

  def edit
    #@recipe = Recipe.find(params[:id])
  end

  def update
    #@recipe = Recipe.find(params[:id])
    @recipe.update_attributes(params[:recipe])
    redirect_to(@recipe)
  end

  def destroy
    #@recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect_to(recipes_path)
  end

end
