class CitiesController < ApplicationController
  def index
    @cities = City.all
    render :index
  end

  def new
    render :new
  end

  def create
    City.create(name: params[:name], avg_salary: params[:avg_salary], image_url: params[:image_url])
    redirect_to "/cities"
  end

  def show
    @city = City.find(params[:id])
    render :show
  end

  def edit
    @city = City.find(params[:id])
    render :edit
  end

  def update
City.update(name: params[:name], avg_salary: params[:avg_salary], image_url: params[:image_url])
    redirect_to "/cities"
  end

end
