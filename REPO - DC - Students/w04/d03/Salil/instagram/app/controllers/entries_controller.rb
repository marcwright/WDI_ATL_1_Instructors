class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    render :index
  end

  def new
    render :new
  end

  def show
     @entry = Entry.find(params[:id])
    render :show
  end

end
