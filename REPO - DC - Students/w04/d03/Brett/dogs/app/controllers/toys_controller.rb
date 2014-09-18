class ToysController < ApplicationController

  def index
    @toys = Dog.find(params["dog.id"]).toys
  end

end
