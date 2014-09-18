class ProductsController < ApplicationController

  def index
  end

  def search
    render :index
  end

  def show
    @product = {id: params[:id].to_i, name: 'awesome product', category: 'awesomeness'}

    if params[:id]== '666'
    redirect_to 'http://google.co.uk'
  end

  end

  def special_show
  end
end
