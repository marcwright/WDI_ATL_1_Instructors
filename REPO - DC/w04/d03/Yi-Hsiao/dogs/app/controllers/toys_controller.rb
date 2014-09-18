class ToysController < ApplicationController
  def index
    @dog = Dog.find(params[:dog_id])
    @toys = @dog.toys
  end

  def new
    @dog = Dog.find(params[:dog_id])
    @toy = Toy.new
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @toy = @dog.toys.new(toy_params)

    if @toy.save
      redirect_to @toy
    else
      render "new"
    end
  end

  def show
    @toy = Toy.find(params[:id])
    @dog = @toy.dog
  end

  private
    def toy_params
      params.require(:toy).permit(:name, :photo_url)
    end
end
