class VicSecretsController < ApplicationController
  def index
    @models = Model.all
    render :index
  end

  def new
    render :new
  end

  def create
    Model.create(name: params[:name], age: params[:age], image_url: params[:image_url])
    redirect_to('/models')
  end

  def show
    @model = Model.find(params[:id])
    render :show
  end
end
