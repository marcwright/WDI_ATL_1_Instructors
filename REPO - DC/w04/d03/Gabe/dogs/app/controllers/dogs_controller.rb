class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    render :index
  end

  def new
    render :new
  end

  def create
    Dog.create(name: params[:name], age: params[:age], image_url: params[:image_url])
    redirect_to '/dogs'
  end

def show
  @dog = Dog.find(params[:id])
  render :show
end


end
