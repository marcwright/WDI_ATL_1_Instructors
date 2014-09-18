class ProductsController < ApplicationController

  def index
    render json: Product.order("code ASC").all
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product
    else
      render status: 400, nothing: true
    end
  end

  def show
    @product = Product.find(params[:id])

    if @product
      render json: @product
    else
      render status: 400, nothing: true
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      render json: @product
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def product_params
    params.require(:product).permit(:code, :name, :price, :quantity)
  end
  
end