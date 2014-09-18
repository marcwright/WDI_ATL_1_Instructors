class ToysController < ApplicationController

  def index
    @toys = Toy.where(dog_id: params["dog_id"])
  end

  def show
    @toy = Toy.find(params[:id])
  end

  def new

  end
end
